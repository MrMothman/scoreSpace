extends Node

const WORSHIP_CARD = preload("res://scenes/objects/cards/worship_card.tscn")
const COAL_CARD = preload("res://scenes/objects/cards/coal_card.tscn")

@onready var hand = $CanvasLayer/subBoard/hand
@onready var ap = $AnimationPlayer
@onready var card_holder = $CanvasLayer/cardHolder

var is_open: bool =  false
var is_closed: bool =  true
var is_in_subBoard: bool = false

var held_card: UsableCard

signal click_with_card(card)

func _on_button_2_button_down():
	var worshipCard = WORSHIP_CARD.instantiate()
	print(worshipCard)
	hand.add_card(worshipCard)


func _on_button_button_down():
	var coalCard = COAL_CARD.instantiate()
	hand.add_card(coalCard)

func _on_exiting_mouse_entered():
	if is_open && !ap.is_playing():
		ap.play("mouse_leaves")
		is_closed = true
		is_open = false

func _on_sub_board_mouse_entered():
	if is_closed && !ap.is_playing():
		ap.play("mouse_enters")
		is_closed = false
		is_in_subBoard = true
		is_open = true

func _on_hand_card_activated(card: UsableCard):
	print(card)
	add_card_to_holder(card)
	
func _instantiate_card(card_name: String)-> UsableCard:
	var returnCard: UsableCard
	if card_name == "Worship":
		returnCard = WORSHIP_CARD.instantiate()
	elif card_name == "Coal":
		returnCard = COAL_CARD.instantiate()
	return returnCard
	
func add_card_to_holder(card:UsableCard):
	if does_holder_have_card():
		return_card_from_holder()
	card_holder.add_child(card)
	card_holder.set_node_to_global(card_holder.get_child(0))
	
func does_holder_have_card()-> bool:
	return card_holder.get_child(0) != null	
	
func return_card_from_holder():
	var child = card_holder.get_child(0)
	hand.add_card(_instantiate_card(child.get_card_name()))
	card_holder.remove_child(child)
	child.queue_free()
	
func remove_card_from_holder():
	var child = card_holder.get_child(0)
	card_holder.remove_child(child)
	child.queue_free()
	
	
func add_card_to_hand(card_name: String):
	var card: UsableCard = _instantiate_card(card_name)
	hand.add_card(card)
	

func _on_delete_pressed():
	remove_card_from_holder()

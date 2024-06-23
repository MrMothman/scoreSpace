extends Node

const WORSHIP_CARD = preload("res://scenes/objects/cards/worship_card.tscn")
const COAL_CARD = preload("res://scenes/objects/cards/coal_card.tscn")

@onready var hand = $CanvasLayer/subBoard/hand
@onready var ap = $AnimationPlayer

var is_open: bool =  false
var is_closed: bool =  true


func _on_button_2_button_down():
	var worshipCard = WORSHIP_CARD.instantiate()
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
		is_open = true

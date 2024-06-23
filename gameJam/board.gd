extends Node

const WORSHIP_CARD = preload("res://scenes/objects/cards/worship_card.tscn")
const COAL_CARD = preload("res://scenes/objects/cards/coal_card.tscn")


@onready var hand: Hand = $CanvasLayer/hand


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_2_button_down():
	var worshipCard = WORSHIP_CARD.instantiate()
	hand.add_card(worshipCard)


func _on_button_button_down():
	var coalCard = COAL_CARD.instantiate()
	hand.add_card(coalCard)

extends Control
@onready var panel = $Panel
@onready var ap = $AnimationPlayer

var openfinnished: bool = false
@onready var spawn = $Panel/spawn

@onready var coal_card : PackedScene = preload("res://scenes/objects/cards/coalCard.tscn")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "mouse_on":
		openfinnished = true
		
		


func _on_button_pressed():
	var card = coal_card.instantiate()
	spawn.add_child(card)


func _on_area_2d_mouse_entered():
	openfinnished = false
	ap.play("mouse_on")


func _on_area_2d_mouse_exited():
	if openfinnished:
		ap.play("mouse_off")



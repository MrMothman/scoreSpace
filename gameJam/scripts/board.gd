extends Control
@onready var panel = $Panel
@onready var ap = $AnimationPlayer

var openfinnished: bool = false

func _on_panel_mouse_entered():
	openfinnished = false
	ap.play("mouse_on")

func _on_panel_mouse_exited():
	if openfinnished:
		ap.play("mouse_off")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "mouse_on":
		openfinnished = true
		
		

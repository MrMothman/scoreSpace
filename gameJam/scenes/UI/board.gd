extends Control

@onready var ap = $AnimationPlayer




func _on_panel_mouse_entered():
	ap.play("mouse_on")


func _on_panel_mouse_exited():
	ap.play("mouse_off")

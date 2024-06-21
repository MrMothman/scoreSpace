class_name  MainMenu
extends Control

@onready var StartButton = $MarginContainer/HBoxContainer/VBoxContainer/StartButton as Button
@onready var ExitButton = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
@export var StartLevel = preload("res://scenes/levels/level.tscn") as PackedScene

func _ready():
	StartButton.button_down.connect(on_Start_press)
	ExitButton.button_down.connect(on_Exit_pressed)
	
func on_Start_press()->void:
	get_tree().change_scene_to_packed(StartLevel)
	
func on_Exit_pressed() ->void:
	get_tree().quit()

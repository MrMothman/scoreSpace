class_name  MainMenu
extends Control

@onready var StartButton = $MarginContainer/HBoxContainer/VBoxContainer/StartButton as Button
@onready var ExitButton = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
@onready var OptionsButton = $MarginContainer/HBoxContainer/VBoxContainer/OptionsButton as Button
@export var StartLevel = preload("res://scenes/levels/level.tscn") as PackedScene


func _ready():
	handle_connecting_signals()
	
func on_Start_press()->void:
	get_tree().change_scene_to_packed(StartLevel)

func on_Options_press() -> void:
	print("LOAD OPTIONS MENU")
	
func on_Exit_press() ->void:
	get_tree().quit()

func handle_connecting_signals() -> void:
	StartButton.button_down.connect(on_Start_press)
	OptionsButton.button_down.connect(on_Options_press)
	ExitButton.button_down.connect(on_Exit_press)

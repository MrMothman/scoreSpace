class_name Options_Menu
extends Control

@onready var ExitButton = $MarginContainer/VBoxContainer/OptionsExitButton as Button

signal exit_options_menu

func _ready():
	ExitButton.button_down.connect(on_exit_press)
	set_process(false)
	
func on_exit_press() ->void:
	exit_options_menu.emit()
	set_process(false)




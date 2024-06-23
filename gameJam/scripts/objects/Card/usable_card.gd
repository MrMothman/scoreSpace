class_name UsableCard extends Node2D
#region signals

signal mouse_entered(card: Card)
signal mouse_exited(card: Card)

#endregion


@onready var card = $card

func get_card_name():
	return card.get_card_name()

func _on_card_mouse_entered(card: Card):
	mouse_entered.emit(self)


func _on_card_mouse_exited(card: Card):
	mouse_exited.emit(self)

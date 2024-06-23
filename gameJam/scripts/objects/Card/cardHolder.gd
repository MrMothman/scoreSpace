extends Node2D

var cardHeld: UsableCard


func _process(delta):
	self.global_position = get_global_mouse_position()

func set_node_to_global(card: UsableCard):
	card.global_position = get_global_mouse_position()
	

@tool
extends Node2D

@export var godImage: Texture
@export var timeMov: int = 5
# Called when the node enters the scene tree for the first time.
@onready var godMove = UsableGod.new()
@onready var god_picture = $godPicture
@onready var move_timer = $moveTimer

signal change_direction
signal card_entered(body: Node2D)

func _ready():
	god_picture.texture = godImage
	move_timer.start(timeMov)



func _on_time_between_moves_timeout():
	change_direction.emit()
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D):
	card_entered.emit(body)

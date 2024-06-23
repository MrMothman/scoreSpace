extends Control

@onready var ap = $AnimationPlayer
@onready var is_closed : bool = true
@onready var openfinnished: bool = false
@onready var spawn = $Panel/spawn
@onready var boardTimer = $board_closing_timer


func _ready():
	boardTimer.one_shot = true

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "mouse_on":
		openfinnished = true

func _on_area_2d_mouse_entered():
	if is_closed:
		ap.play("mouse_on")
		if boardTimer.is_stopped():
			boardTimer.start(.5)

func _on_exit_switch_mouse_entered():
	if openfinnished:
		ap.play("mouse_off")
		if boardTimer.is_stopped():
			boardTimer.start(.5)

func _on_board_closing_timer_timeout():
	if is_closed == true:
		openfinnished = true
		is_closed = false
	elif is_closed == false:
		openfinnished = false
		is_closed = true

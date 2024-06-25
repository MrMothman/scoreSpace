extends CharacterBody2D
class_name UsableGod

var current_states = enemy_states.MOVE_DR
enum enemy_states {STOP,MOVE_R,MOVE_L,MOVE_D,MOVE_U,MOVE_DR,MOVE_DL,MOVE_UR,MOVE_UL}
@export var speed = 10
var dir

signal card_entered(body:Node2D)


func _physics_process(delta):
	
	match current_states:
		enemy_states.MOVE_R:
			move_right()
		enemy_states.MOVE_L:
			move_left()
		enemy_states.MOVE_D:
			move_down()
		enemy_states.MOVE_U:
			move_up()
		enemy_states.MOVE_DR:
			move_down_right()
		enemy_states.MOVE_DL:
			move_down_left()
		enemy_states.MOVE_UR:
			move_up_right()
		enemy_states.MOVE_UL:
			move_up_right()
		enemy_states.STOP:
			move_stop()
	
	move_and_slide()

func random_generation():
	dir = randi() % 12
	random_direction()
	
func random_direction():
	match dir:
		0:
			current_states = enemy_states.MOVE_R
		1:
			current_states = enemy_states.MOVE_L
		2:
			current_states = enemy_states.MOVE_D
		3:
			current_states = enemy_states.MOVE_U
		4:
			current_states = enemy_states.MOVE_DR
		5:
			current_states = enemy_states.MOVE_DL
		6:
			current_states = enemy_states.MOVE_UL
		7:
			current_states = enemy_states.MOVE_UR
		8:
			current_states = enemy_states.STOP
		9:
			current_states = enemy_states.STOP
		10:
			current_states = enemy_states.STOP
		11:
			current_states = enemy_states.STOP

#region direction
func move_right():
	velocity = Vector2.RIGHT * speed
	#$anim.play("move_right")

func move_left():
	velocity = Vector2.LEFT * speed
	#$anim.play("move_left")

func move_down():
	velocity = Vector2.DOWN * speed
	#$anim.play("move_down")

func move_up():
	velocity = Vector2.UP * speed
	#$anim.play("move_up")
	
func move_down_right():
	velocity = (Vector2.DOWN + Vector2.RIGHT).normalized() * speed
	#$anim.play("move_up")

func move_down_left():
	velocity = (Vector2.DOWN + Vector2.LEFT).normalized() * speed
	#$anim.play("move_up")

func move_up_right():
	velocity = (Vector2.UP + Vector2.RIGHT).normalized() * speed
	#$anim.play("move_up")

func move_up_left():
	velocity = (Vector2.UP + Vector2.LEFT).normalized() * speed
	#$anim.play("move_up")
	
func move_stop():
	velocity = Vector2.ZERO
#endregion

func _on_god_change_direction():
	random_generation()
	
func _on_god_card_entered(body):
	card_entered.emit(body)

extends Camera2D

# set camera size and stuff here

func _process(delta):
	print(position)
	if Input.is_action_pressed("ui_right"):
			position.x += 1000*delta
	if Input.is_action_pressed("ui_left"):
			position.x -= 1000*delta

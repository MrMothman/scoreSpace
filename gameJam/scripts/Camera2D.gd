extends Camera2D

# set camera size and stuff here

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		if position.x < 1600:
			position.x += 1000*delta
	if Input.is_action_pressed("ui_left"):
		if position.x > -400:
			position.x -= 1000*delta

extends Camera2D

# set camera defaluts here

#make variables come from game manager only temp variables
var cam_speed = 1000
var cam_limit_r = 1400
var cam_limit_L = -400


func _process(delta):
	if Input.is_action_pressed("ui_right"):
		if position.x < cam_limit_r:
			position.x += cam_speed * delta
	if Input.is_action_pressed("ui_left"):
		if position.x > cam_limit_L:
			position.x -= cam_speed * delta

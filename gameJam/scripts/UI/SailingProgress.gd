extends ProgressBar

var is_slowed_down = false
var boat_image = preload("res://assets/UI/FrontBoatModelV3.png")
signal score_changed(value)
@onready var progress_indicator = $ProgressEmoji
@onready var timer = $ProgressTimer

func _ready():
	value = 0
	max_value = 100
	custom_minimum_size = Vector2(200, 20)
	setup_progress_indicator()
	setup_timer()

func setup_progress_indicator():
	var emoji = TextureRect.new()
	emoji.texture = boat_image
	emoji.name = "ProgressEmoji"
	add_child(emoji)
	var scale_factor = size.y / emoji.texture.get_height()
	emoji.scale = Vector2(scale_factor, scale_factor)
	progress_indicator = emoji
	update_progress_indicator()

func setup_timer():
	timer.wait_time = 0.1
	timer.autostart = true
	timer.connect("timeout", Callable(self, "_on_ProgressTimer_timeout"))
	timer.start()

func update_progress_indicator():
	var pos_x = size.x * (value / max_value) - (progress_indicator.size.x * progress_indicator.scale.x) / 2
	progress_indicator.position = Vector2(pos_x, 0)
	modulate = Color(1, 0, 0) if value >= 90 else Color(1, 1, 1)

func _on_ProgressTimer_timeout():
	if value < max_value:
		value += 0.5 if is_slowed_down else 1
	else:
		value = 0
		is_slowed_down = false
	update_progress_indicator()

func _on_brake_button_pressed():
	if value >= 90:
		emit_signal("score_changed", 100)
		is_slowed_down = false
	else:
		emit_signal("score_changed", -10)
		is_slowed_down = true
	update_progress_indicator()

extends ProgressBar

var boat_image = preload("res://assets/UI/AppleSailboatEmoji.png")  # Load the emoji image for progress

func _ready():
	value = 0
	max_value = 100
	
	# Set a fixed size for the progress bar
	custom_minimum_size = Vector2(200, 20)  # Adjust these values as needed
	
	# Setup the visual progress indicator
	setup_progress_indicator()
	
	# Configure and start the timer
	var timer = $ProgressTimer
	timer.wait_time = 0.1  # Update interval in seconds
	timer.autostart = true
	timer.connect("timeout", Callable(self, "_on_ProgressTimer_timeout"))
	timer.start()

func setup_progress_indicator():
	# Create a TextureRect node to serve as the visual indicator
	var emoji = TextureRect.new()
	emoji.texture = boat_image
	emoji.name = "ProgressEmoji"
	add_child(emoji)
	
	# Size the emoji to fit the height of the progress bar
	var scale_factor = size.y / emoji.texture.get_height()
	emoji.scale = Vector2(scale_factor, scale_factor)
	
	update_progress_indicator()  # Position it correctly initially

func update_progress_indicator():
	# Find the emoji node and update its position based on the current progress
	var progress_indicator = $ProgressEmoji
	var pos_x = size.x * (value / max_value) - (progress_indicator.size.x * progress_indicator.scale.x) / 2
	var pos_y = 0
	progress_indicator.position = Vector2(pos_x, pos_y)


func _on_ProgressTimer_timeout():
	if value < max_value:
		value += 1
	else:
		value = 0  # Reset the progress bar
	update_progress_indicator()  # Update the position of the progress emoji

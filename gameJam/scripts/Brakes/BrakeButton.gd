extends CheckButton

@onready var sailing_progress = $SailingProgress  # Adjust the path if necessary
@onready var score_board = $ScoreBoard  # Adjust the path if necessary

func _ready():
	self.connect("toggled", Callable(self, "_on_CheckButton_toggled"))

func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		# Check if the ProgressBar is within the last 8%
		var progress = sailing_progress.value / sailing_progress.max_value
		if progress > 0.92:  # More than 92% progress
			# Increase score by 100 idk
			button_pressed = false

extends CheckButton

@onready var sailing_progress = $SailingProgress


func _ready():
	connect("toggled", Callable(self, "_on_CheckButton_toggled"))

func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		sailing_progress.brake_button_pressed()
		set_pressed_no_signal(false)

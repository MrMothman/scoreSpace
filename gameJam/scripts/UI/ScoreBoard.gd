extends CanvasLayer

var score = 0
@onready var sailing_progress = $"../SailingProgress"
@onready var score_label = $scoreControl/Score

func _ready():
	if sailing_progress:
		print("SailingProgress node found and connected.")
		sailing_progress.connect("score_changed", Callable(self, "_on_score_changed"))
	else:
		print("Error: SailingProgress node not found.")
	update_score(0)

func _on_score_changed(value):
	update_score(value)

func update_score(value):
	score += value
	score_label.text = "Score: " + str(score)

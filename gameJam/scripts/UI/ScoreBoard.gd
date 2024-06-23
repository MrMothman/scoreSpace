extends CanvasLayer

var score = 0

func update_score(value):
	#proper score logic is needed here
	score += value
	$scoreControl/Score.text = "Score: " + var_to_str(score)
# Called when the node enters the scene tree for the first time.

func _ready():
	update_score(score)


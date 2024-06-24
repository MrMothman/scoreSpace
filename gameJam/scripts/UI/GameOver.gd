extends Leaderboard

# Declare the variables to access the nodes
@onready var submit_button = $Submit
@onready var name_input = $UserInput
func _ready():
	submit_button.connect("pressed", Callable(self, "_on_submit_button_pressed"))
	_authentication_request()
	

func _on_submit_button_pressed():
	# Get the player's name from the LineEdit node
	var player_name = name_input.text
	
	# Here you can handle the player's name (e.g., save it, display it, etc.)
	print("Player's name: " + player_name)
	#_change_player_name(player_name)
	_upload_score(score)
	_get_leaderboards()
	
	
	# Optionally, you might want to hide or disable the input elements after submission
	name_input.editable = false
	submit_button.disabled = true
	
	## start next scene function HERE
	
	


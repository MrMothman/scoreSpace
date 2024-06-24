extends Leaderboard

# Sample data for the leaderboard
#var leaderboard_data = [
#	{"rank": 1, "name": "Player1", "score": 1000},
#	{"rank": 2, "name": "Player2", "score": 900},
#	{"rank": 3, "name": "Player3", "score": 800}
#]

func _ready():
	# Reference to the container holding the leaderboard entries
	var entries_container = $VBoxContainer/VBoxContainer
	_authentication_request()
	var leaderboard = leaderboard_data()

	# Clear any existing children (for dynamic updates)
	#entries_container.clear()

	# Add header
	var header = HBoxContainer.new()
	var rank_label = Label.new()
	rank_label.text = "Rank"
	var name_label = Label.new()
	name_label.text = "Name"
	var score_label = Label.new()
	score_label.text = "Score"
	header.add_child(rank_label)
	header.add_child(name_label)
	header.add_child(score_label)
	entries_container.add_child(header)

	# Add leaderboard entries
	for entry in leaderboard_data:
		var hbox = HBoxContainer.new()
		var rank = Label.new()
		rank.text = str(entry["rank"])
		var name = Label.new()
		name.text = entry["name"]
		var score = Label.new()
		score.text = str(entry["score"])
		hbox.add_child(rank)
		hbox.add_child(name)
		hbox.add_child(score)
		entries_container.add_child(hbox)


func leaderboard_data():
	

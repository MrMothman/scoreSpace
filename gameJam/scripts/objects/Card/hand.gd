@tool
class_name Hand extends Node2D

signal card_activated(card: UsableCard)

@export var hand_radius : int = 900
@export var angle_limit: float = 50
@export var max_spread_angle: float = 7
@onready var debug = $debug

var touched: Array = []
var inHand: Array = []
var current_selected_card: int = -1

func add_card(card : Node2D):
	inHand.push_back(card)
	print(card)
	add_child(card)
	card.mouse_entered.connect(_manage_highlighted_cards)
	card.mouse_exited.connect(_manage_unhighlighting_cards)
	reposition_cards()

func remove_card(index: int):
	print(index)
	if inHand.is_empty():
		printerr("Canno remove from an empty hand")
		return
	var removing_card = inHand[index]
	touched.remove_at(touched.find(inHand[index]))
	inHand.remove_at(index)
	remove_child(removing_card)
	reposition_cards()
	return removing_card

func reposition_cards():
	var card_spread = min((angle_limit / inHand.size()), max_spread_angle)
	var current_angle = -(card_spread * (inHand.size() - 1))/2 - 90
	for card in inHand:
		_card_transform_update(card, current_angle)
		current_angle += card_spread
	
func _card_transform_update(card: Node2D, angle_in_deg: float):
	card.position = get_card_position(angle_in_deg)
	card.rotation = deg_to_rad(angle_in_deg + 90)

func get_card_position(angle_in_degrees: float)-> Vector2:
	var x: float = hand_radius * cos(deg_to_rad(angle_in_degrees))
	var y: float = hand_radius * sin(deg_to_rad(angle_in_degrees))
	return Vector2(x,y)

func _manage_highlighted_cards(card: Node2D):
	touched.push_back(card)
	
func _manage_unhighlighting_cards(card: Node2D):
	touched.remove_at(touched.find(card))

func _input(event):
	if event.is_action_pressed("mouse_click") && current_selected_card >= 0:
		var card: UsableCard = remove_card(current_selected_card)
		current_selected_card = -1
		card_activated.emit(card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for card in inHand:
		current_selected_card = -1
		card.z_index = 0
			
	if !touched.is_empty():
		var highestIndex: int
		for card in touched:
			highestIndex = max(highestIndex, inHand.find(card))
		if highestIndex >= 0 && highestIndex < inHand.size():
			inHand[highestIndex].z_index = 1
			current_selected_card = highestIndex
			
	
	if (debug.shape as CircleShape2D).radius != hand_radius:
		(debug.shape as CircleShape2D).set_radius(hand_radius)



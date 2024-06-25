@tool
class_name Card extends Node2D

@onready var image = $cardImage/image
@onready var label = $TextBackground/background/Label
@onready var resource = $ResourceGem/Resource

@export var card_name: String = ""
@export var cardImageTexture : Texture
@export var resourceImageTexture : Texture
@export var description : String


signal mouse_entered(card: Card)
signal mouse_exited(card: Card)

func _ready():
	set_values(description,cardImageTexture,resourceImageTexture)

func _process(delta):
	_update_graphics()
	
func get_card_name():
	return card_name	
	
func set_values(_description: String, _cardImage: Texture, _resourceImage: Texture):
	image.texture = _cardImage
	resource.texture = _resourceImage
	label.text = _description
	_update_graphics()

func _update_graphics():
	if label.text != description:
		label.text = description
	if image.texture != cardImageTexture:
		image.texture = cardImageTexture
	if resource.texture != resourceImageTexture:
		resource.texture = resourceImageTexture


func _on_area_2d_mouse_entered():
	mouse_entered.emit(self)


func _on_area_2d_mouse_exited():
	mouse_exited.emit(self)


func _on_area_2d_input_event(viewport, event, shape_idx):
	pass # Replace with function body.

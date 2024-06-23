@tool
class_name Card extends Node2D

@onready var card_animation = $cardAnimation

@onready var card_selected = false

@onready var image = $cardImage/image
@onready var label = $TextBackground/background/Label
@onready var resource = $ResourceGem/Resource

@export var cardImageTexture : Texture
@export var resourceImageTexture : Texture
@export var description : String


func _ready():
	set_values(description,cardImageTexture,resourceImageTexture)

func _process(delta):
	_update_graphics()
	
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
	card_animation.play("card_hovered")
	card_selected = true

func _on_area_2d_mouse_exited():
	card_animation.play(("card_unhovered"))
	card_selected = false


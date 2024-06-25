extends Node2D

const CHEMISTRY_GOD = preload("res://scenes/gods/chemistry_god.tscn")
const ELEPHANT_GOD = preload("res://scenes/gods/elephant_god.tscn")
const FOX_GOD = preload("res://scenes/gods/fox_god.tscn")
const SLIME_GOD = preload("res://scenes/gods/slime_god.tscn")
const SNAKE_GOD = preload("res://scenes/gods/snake_god.tscn")


@onready var gods: Array = ["chem","elephant","fox","slime","snake"]
@onready var rng = RandomNumberGenerator.new()
@onready var god_spawn_area = $godSpawnArea


func get_god(name: String):
	var godScene
	if name == "chem":
		godScene = CHEMISTRY_GOD.instantiate()
	elif name == "elephant":
		godScene = ELEPHANT_GOD.instantiate()
	elif name == "fox":
		godScene = FOX_GOD.instantiate()
	elif name =="slime":
		godScene = SLIME_GOD.instantiate()
	elif name =="snake":
		godScene = SNAKE_GOD.instantiate()
	return godScene

func spawn_gods(amount: int):
	for x in amount:
		var god = get_god(gods[rng.randi_range(0,gods.size() - 1)])
		add_child(god)
		god.card_entered.connect(_handle_god_card_interaction)
		var position = god_spawn_area.position + Vector2(randf() * god_spawn_area.size.x, randf()* god_spawn_area.size.y)
		god.position = position
		
func _on_button_pressed():
	spawn_gods(1)

func _handle_god_card_interaction(body: Node2D):
	print("printing the body:", body)





extends Node
class_name MapGraph

enum types {MAINLAND,b,c,d}

@export var map = {Ports.new("I1", types.MAINLAND, Vector2(1,1)): [2,3],
	Ports.new("I2", types.b, Vector2(1,1)): [4],
	Ports.new("I3", types.c, Vector2(1,1)): [4],
	Ports.new("I4", types.MAINLAND, Vector2(1,1)): [5,6],
	Ports.new("I5", types.c, Vector2(1,1)): [7,8],
	Ports.new("I6", types.b, Vector2(1,1)): [7,8],
	Ports.new("I7", types.b, Vector2(1,1)): [8,9],
	Ports.new("I8", types.b, Vector2(1,1)): [10,1],
	Ports.new("I9", types.c, Vector2(1,1)): [11],
	Ports.new("I10", types.d, Vector2(1,1)): [12,1],
	Ports.new("I11", types.c, Vector2(1,1)): [10,12],
	Ports.new("I12", types.b, Vector2(1,1)): [1],
}

func _ready():
	print(map[map.values()[1]])


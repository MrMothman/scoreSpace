extends Node
class_name MapGraph

enum types {MAINLAND,a,b,c,d,e}


@export var map = {Ports.new("I1", types.MAINLAND, Vector2(1,1)): [1,2],
	Ports.new("I2", types.b, Vector2(1,1)): [3],
	Ports.new("I3", types.c, Vector2(1,1)): [3],
	Ports.new("I4", types.MAINLAND, Vector2(1,1)): [4,5],
	Ports.new("I5", types.c, Vector2(1,1)): [6,7],
	Ports.new("I6", types.b, Vector2(1,1)): [6,7],
	Ports.new("I7", types.b, Vector2(1,1)): [7,8],
	Ports.new("I8", types.b, Vector2(1,1)): [0,9],
	Ports.new("I9", types.c, Vector2(1,1)): [10],
	Ports.new("I10", types.d, Vector2(1,1)): [0,11],
	Ports.new("I11", types.c, Vector2(1,1)): [9,11],
	Ports.new("I12", types.b, Vector2(1,1)): [0]
}


func _ready():
	print(map[map.values()[1]])


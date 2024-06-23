extends Node

enum types {a,b,c,d}

var map = {Ports.new("I1", types.a, Vector2(1,1)): [2,3],
	Ports.new("I2", types.b, Vector2(1,1)): [1,4],
	Ports.new("I3", types.c, Vector2(1,1)): [1,4,5],
	Ports.new("I4", types.d, Vector2(1,1)): [2,3,6],
	Ports.new("I5", types.c, Vector2(1,1)): [3,6],
	Ports.new("I6", types.a, Vector2(1,1)): [4,5],
}

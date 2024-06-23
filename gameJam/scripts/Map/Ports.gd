extends Node

class_name Ports

var port_name
var port_type
var port_pos

func _init(name, type, pos):
	port_name = name
	port_type = type
	port_pos = pos

func getType():
	return port_type

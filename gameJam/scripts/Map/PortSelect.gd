extends MapGraph

func _ready():
	$PortSelect.get_popup().add_item(map.keys()[1].port_name)
	
	$PortSelect.get_popup().id_pressed.connect(_on_item_pressed)


func _on_item_pressed(id):
	var port_name = $PortSelect.get_popup().get_item_text(id)
	print(port_name)
	# func set_dest(port_name)


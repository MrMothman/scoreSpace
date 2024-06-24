extends MapGraph

var port_num = 0
var next_num = 1

var next_ports = map.values()[port_num]

func _ready():
	for p in next_ports:
		$PortSelect.get_popup().add_item(map.keys()[p].port_name)

	$PortSelect.get_popup().id_pressed.connect(_on_item_pressed)


func _on_item_pressed(id):
	#var next_port = $PortSelect.get_popup().get_item_text(id)
	#print(id)
	#print(next_port)
	var ports = next_ports.size()
	next_num = next_ports[id]

	#next_ports = map.values()[next_num]

	for i in range(ports):
		$PortSelect.get_popup().remove_item(0)

	for p in next_ports:
		$PortSelect.get_popup().add_item(map.keys()[p].port_name)

func departure_next_port_update():
	port_num = next_num
	next_ports = map.values()[port_num]
	var ports = next_ports.size()
	next_num = next_ports[randi() % ports]

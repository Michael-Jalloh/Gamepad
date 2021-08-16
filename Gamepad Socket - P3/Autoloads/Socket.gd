extends Node

signal packet_recv

var socket = null

func connect_to_server(host, port):
	socket = PacketPeerUDP.new()
	socket.set_dest_address(host, int(port))
	get_tree().change_scene("res://Gamepad.tscn")

func _send_data(data: String):
	if socket:
		socket.put_packet(data.to_ascii())

func _process(delta):
	if (socket != null and socket.get_available_packet_count() > 0):
		var data = socket.get_packet().get_string_from_ascii()
		emit_signal("packet_recv", data)

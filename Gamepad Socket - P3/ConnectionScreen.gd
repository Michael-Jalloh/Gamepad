extends Control

onready var host = find_node("Host")
onready var port = find_node("Port")

func _on_Button_pressed():
	if host.text == "" or port.text == "":
		return
	Socket.connect_to_server(host.text, port.text)


func _on_Button2_pressed():
	get_tree().change_scene("res://Gamepad.tscn")

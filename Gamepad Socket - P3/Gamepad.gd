extends Control

var dpad_sprite = {
	"Left": preload("res://assets/BTN White/DPAD_left.png"),
	"Right": preload("res://assets/BTN White/DPAD_right.png"),
	"Up": preload("res://assets/BTN White/DPAD_up.png"),
	"Down": preload("res://assets/BTN White/DPAD_down.png"),
	"Normal": preload("res://assets/BTN White/DPAD_all.png"),
}
onready var dpad = $Dpad
onready var msgboard = $Panel/RichTextLabel

func _ready():
	Socket.connect("packet_recv", self, "data_recv")

func data_recv(data):
	msgboard.text = data

func _process(delta):
	var data = ""
	var buttonState = 0
	var normal = true
	var counter = 0
	for dbtn in get_tree().get_nodes_in_group("d-pad"):
		if(dbtn.is_pressed()):
			dpad.texture = dpad_sprite[dbtn.name]
			normal = false
			buttonState += 1 << counter
		else:
			buttonState += 0 << counter
		counter += 1
	if(normal):
		dpad.texture = dpad_sprite["Normal"]
	for btn in get_tree().get_nodes_in_group("buttons"):
		buttonState += (1 if btn.is_pressed() else 0) << counter
		counter += 1
	for switch in get_tree().get_nodes_in_group("switch"):
		buttonState += (1 if switch.pressed else 0) << counter
		counter += 1
	data += str(buttonState)
	Socket._send_data(data)

func _on_Settings_pressed():
	get_tree().change_scene("res://ConnectionScreen.tscn")

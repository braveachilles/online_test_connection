extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Here must be created the connection (network multiplayer ppeer)


func _on_CreateRoom_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(8000, 4)


func _on_EnterRoom_pressed():
	$PopupEnterCodeRoom.visible = true


func _on_TextureButton_pressed():
	$PopupEnterCodeRoom.visible = false

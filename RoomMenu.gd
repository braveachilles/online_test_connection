extends Control
var network_peer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Here must be created the connection (network multiplayer peer)


func _on_CreateRoom_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(8000, 4)
	network_peer = peer
	Global.player_list.append(peer)
	var http = $HTTPRequest
	http.request("https://api.ipify.org")
	get_tree().change_scene("res://Lobby.tscn")
	
func print_ip(result, response_code, headers, body):
	var ip = body.get_string_from_utf8()
	print("la ip es: " + ip)


func _on_EnterRoom_pressed():
	$PopupEnterCodeRoom.visible = true


func _on_TextureButton_pressed():
	$PopupEnterCodeRoom.visible = false


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var ip = body.get_string_from_utf8()
	print("la ip es: " + ip)

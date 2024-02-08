extends Control

func _ready():
	pass # Replace with function body.

func _on_CreateRoom_pressed():
	
	get_tree().change_scene("res://Lobby.tscn")
	
func _on_EnterRoom_pressed():
	$PopupEnterCodeRoom.visible = true

func _on_TextureButton_pressed():
	$PopupEnterCodeRoom.visible = false




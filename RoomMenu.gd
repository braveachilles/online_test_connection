extends Control

var ip_splited

func _ready():
	pass # Replace with function body.

func _on_CreateRoom_pressed():
	
	get_tree().change_scene("res://Lobby.tscn")
	
func _on_EnterRoom_pressed():
	$PopupEnterCodeRoom.visible = true

func _on_TextureButton_pressed():
	$PopupEnterCodeRoom.visible = false

func codeDecryption(codeToDecrypt):
	var positionInIp = 0
	var originalIp: String
	for i in codeToDecrypt.length():
		if codeToDecrypt[i] == "0" or codeToDecrypt[i] == "1" or codeToDecrypt[i] == "2" or codeToDecrypt[i] == "3" or codeToDecrypt[i] == "4" or codeToDecrypt[i] == "5" or codeToDecrypt[i] == "6" or codeToDecrypt[i] == "7" or codeToDecrypt[i] == "8" or codeToDecrypt[i] == "9":
			positionInIp = positionInIp + 1
			originalIp = originalIp + "."
		else:
			match positionInIp:
				0:
					originalIp = originalIp + str(Global.dictionary_ip_block_1.find(codeToDecrypt[i]))
					break
				1:
					originalIp = originalIp + str(Global.dictionary_ip_block_2.find(codeToDecrypt[i]))
					break
				2:
					originalIp = originalIp + str(Global.dictionary_ip_block_3.find(codeToDecrypt[i]))
					break
				3:
					originalIp = originalIp + str(Global.dictionary_ip_block_4.find(codeToDecrypt[i]))
					break
			
	var united_segments_list = []
	
	
	ip_splited = originalIp.split(".")
	print(ip_splited)
	#print("la ip es: " + ip)
	var ip_segment_1 = int(ip_splited[0])/3
	var ip_segment_2 = int(ip_splited[1])-17
	var ip_segment_3 = int(ip_splited[2])/4
	var ip_segment_4 = int(ip_splited[3])-21
	var ip = str(ip_segment_1) + "." + str(ip_segment_2) + "." + str(ip_segment_3) + "." + str(ip_segment_4) 
	
	print(ip)
	

func _on_Continue_pressed():
	codeDecryption($PopupEnterCodeRoom/VBoxContainer/TextEdit.text)
	
	
	
	

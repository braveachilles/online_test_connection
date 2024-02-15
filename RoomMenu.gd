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
	print(str(codeToDecrypt) + " el largo es: " + str(codeToDecrypt.length()))
	var positionInIp = 0
	var originalIp: String
	for i in range(0, codeToDecrypt.length()):
		if codeToDecrypt[i] == "0" or codeToDecrypt[i] == "1" or codeToDecrypt[i] == "2" or codeToDecrypt[i] == "3" or codeToDecrypt[i] == "4" or codeToDecrypt[i] == "5" or codeToDecrypt[i] == "6" or codeToDecrypt[i] == "7" or codeToDecrypt[i] == "8" or codeToDecrypt[i] == "9":
			#positionInIp = positionInIp + 1
			originalIp = originalIp + "."
			positionInIp = positionInIp + 1
			print(str(codeToDecrypt[i -3]) + str(codeToDecrypt[i -2]) + str(codeToDecrypt[i -1]))
		elif codeToDecrypt[i] != "0" and codeToDecrypt[i] != "1" and codeToDecrypt[i] != "2" and codeToDecrypt[i] != "3" and codeToDecrypt[i] != "4" and codeToDecrypt[i] != "5" and codeToDecrypt[i] != "6" and codeToDecrypt[i] != "7" and codeToDecrypt[i] != "8" and codeToDecrypt[i] != "9":
			
			match positionInIp:
				0:
					originalIp = originalIp + str(Global.dictionary_ip_block_1.find(codeToDecrypt[i]))
#					print(codeToDecrypt[i])
#					print(str(Global.dictionary_ip_block_1.find(codeToDecrypt[i])))
				1:
					originalIp = originalIp + str(Global.dictionary_ip_block_2.find(codeToDecrypt[i]))
					print(codeToDecrypt[i])
					print(str(Global.dictionary_ip_block_2.find(codeToDecrypt[i])))
				2:
					originalIp = originalIp + str(Global.dictionary_ip_block_3.find(codeToDecrypt[i]))
					
				3:
					originalIp = originalIp + str(Global.dictionary_ip_block_4.find(codeToDecrypt[i]))
					
					
		
		
	var united_segments_list = []
	
	
	ip_splited = originalIp.split(".")
	
	print(ip_splited[0])
	print(ip_splited[1])
	print(ip_splited[2])
	print(ip_splited[3])
	var ip_segment_1 = int(ip_splited[0])/3
	var ip_segment_2 = int(ip_splited[1])-17
	var ip_segment_3 = int(ip_splited[2])/4
	var ip_segment_4 = int(ip_splited[3])-21
	var ip = str(ip_segment_1) + "." + str(ip_segment_2) + "." + str(ip_segment_3) + "." + str(ip_segment_4) 
	
	#print(ip)
	print("la ip es: " + ip)
	return ip

func _on_Continue_pressed():
	$ConnectionManager.connectToServer(codeDecryption($PopupEnterCodeRoom/VBoxContainer/TextEdit.text))
	
	
	
	

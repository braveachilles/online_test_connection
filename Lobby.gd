extends Control
var network_peer
var room_number
var player_list
var chat_list
var host_player
var chat_message_enter
var ip_splited


func _ready():
	room_number = $RoomNumber
	player_list = $PlayerList
	chat_list = $Chat
	chat_message_enter = $ChatMessageEnter
#	var peer = NetworkedMultiplayerENet.new()
#	peer.create_server(8000, 4)
#	network_peer = peer
#	Global.player_list.append(peer)
	$ConnectionManager.createServer()
	var http = $HTTPRequest
	http.request("https://api.ipify.org")
	host_player = "Player 1 (Host)"
	player_list.add_item(host_player, null, false)
	
	
func codeEncryption():
	
	
	var ip_segment_1 = int(ip_splited[0])*3
	var ip_segment_2 = int(ip_splited[1])+17
	var ip_segment_3 = int(ip_splited[2])*4
	var ip_segment_4 = int(ip_splited[3])+21
	var united_segments_list = []
	
	
	for i in range (0, str(ip_segment_1).length()):
		united_segments_list.append(Global.dictionary_ip_block_1[int(str(ip_segment_1)[i])])
	united_segments_list.append(getRandom())
	for i in range (0, str(ip_segment_2).length()):
		united_segments_list.append(Global.dictionary_ip_block_2[int(str(ip_segment_2)[i])])
	united_segments_list.append(getRandom())
	for i in range (0, str(ip_segment_3).length()):
		united_segments_list.append(Global.dictionary_ip_block_3[int(str(ip_segment_3)[i])])
	united_segments_list.append(getRandom())
	for i in range (0, str(ip_segment_4).length()):
		united_segments_list.append(Global.dictionary_ip_block_4[int(str(ip_segment_4)[i])])

		#segment_1_of_1 = dictionary_ip_block_1[int(str(ip_segment_1)[0])]
	
	#print("la ip es: " + ip)
	print("value 1:" + str(ip_segment_1) + "value 2:" + str(ip_segment_2) + "value 3:" + str(ip_segment_3) +"value 4:" + str(ip_segment_4))
	print(arrayToString(united_segments_list))
	var roomCode = arrayToString(united_segments_list)
	room_number.text = roomCode

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var ip = body.get_string_from_utf8()
	print(ip)
	ip_splited = ip.split(".")
	codeEncryption()
	
#	var segment_1_of_1 = ""
#	var segment_2_of_1 = ""
#	var segment_3_of_1 = ""
#	var segment_1_of_2 = ""
#	var segment_2_of_2 = ""
#	var segment_3_of_2 = ""
#	var segment_1_of_3 = ""
#	var segment_2_of_3 = ""
#	var segment_3_of_3 = ""
#	var segment_1_of_4 = ""
#	var segment_2_of_4 = ""
#	var segment_3_of_4 = ""
	
	
func arrayToString(array: Array):
	var string = ""
	for i in array:
		string += String(i)
	return string
	
	
func getRandom():
	var actualTime = ""
	actualTime = Time.get_datetime_string_from_system()
	var randomNumber_1 = int ((actualTime.split("T")[1]).split(":")[0])
	var randomNumber_2 = int ((actualTime.split("T")[1]).split(":")[1])
	var randomNumber_3 = int ((actualTime.split("T")[1]).split(":")[2])
	var randomNumber_result = str (randomNumber_1/randomNumber_2 - randomNumber_3)
	var randomNumber_lastCharacter
	for i in randomNumber_result.length():
		if i == randomNumber_result.length() -1:
			randomNumber_lastCharacter = randomNumber_result[i]
	return randomNumber_lastCharacter
	
func _on_SendMessage_pressed():
	chat_list.add_item(chat_message_enter.text)
	chat_message_enter.text = ""



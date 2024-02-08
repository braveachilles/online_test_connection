extends Control
var network_peer
var room_number
var player_list
var chat_list
var host_player
var chat_message_enter

#------------------------ Dictionary -------------------------

const dictionary_ip_block_1 = ["t", "b", "r", "u", "s", "a", "y", "p", "v", "o"]
const dictionary_ip_block_2 = ["z", "w", "q", "i", "y", "u", "x", "f", "e", "l"]
const dictionary_ip_block_3 = ["g", "j", "b", "d", "k", "m", "h", "t", "c", "f"]
const dictionary_ip_block_4 = ["h", "k", "e", "l", "t", "y", "m", "n", "p", "i"]

func _ready():
	room_number = $RoomNumber
	player_list = $PlayerList
	chat_list = $Chat
	chat_message_enter = $ChatMessageEnter
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(8000, 4)
	network_peer = peer
	Global.player_list.append(peer)
	var http = $HTTPRequest
	http.request("https://api.ipify.org")
	host_player = "Player 1 (Host)"
	player_list.add_item(host_player, null, false)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var ip = body.get_string_from_utf8()
	var ip_splited = ip.split(".")
	var ip_segment_1 = int(ip_splited[0])*3
	var ip_segment_2 = int(ip_splited[1])+17
	var ip_segment_3 = int(ip_splited[2])*4
	var ip_segment_4 = int(ip_splited[3])+21
	for i in range (0, count(str(ip_segment_1))):
		var segment_1 = dictionary_ip_block_1[int(str(ip_segment_1)[0])]
	room_number.text = ip
	print("la ip es: " + ip)
	print("value 1:" + str(ip_segment_1) + "value 2:" + str(ip_segment_2) + "value 3:" + str(ip_segment_3) +"value 4:" + str(ip_segment_4))
	print(segment_1)
	
func _on_SendMessage_pressed():
	chat_list.add_item(chat_message_enter.text)
	chat_message_enter.text = ""

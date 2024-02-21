extends Node
var networkPeer
var ip
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect("network_peer_connected", self, "player_connected")
	get_tree().connect("network_peer_disconnected", self, "player_disconnected")
	get_tree().connect("connected_to_server", self, "player_connected_to_server")
	get_tree().connect("connection_failed", self, "connectionFailed")
	get_tree().connect("server_disconnected", self, "serverDisconnected")
	
func connectToServer(ip):
	#ip = "201.214.181.228"
	
#	rpc("network_peer_connected", "player_connected")
	var client = NetworkedMultiplayerENet.new()
	#client.join
	client.create_client(ip, 80)
	#sendMessage()

func createServer():
	var peer = NetworkedMultiplayerENet.new()
	peer.set_compression_mode(NetworkedMultiplayerENet.COMPRESS_RANGE_CODER)
	var err = peer.create_server(8910, 1) # Maximum of 1 peer, since it's a 2-player game.
	get_tree().set_network_peer(peer)
#	connect("connected_to_server", self, "player_connected")
#	connect("connection_failed", self, "player_connected")
#	connect("server_disconnected", self, "player_connected")
#	var server = NetworkedMultiplayerENet.new()
#	server.connect("connected_to_server", self, "player_connected")
#	server.connect("connection_failed", self, "player_connected")
#	server.connect("server_disconnected", self, "player_connected")
	
#	server.create_server(80, 4)
	
func readMessage(message):
	print("message")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func sendMessage():
	print("connecting to server")
	networkPeer.put_var("message", "hello world")
	
func player_connected():
	print("player connected")
	
func player_disconnected():
	print("player disconnected")

func player_connected_to_server():
	print("player connected to server")

func connectionFailed():
	print("connection failed")
	
func serverDisconnected():
	print("server disconnected")


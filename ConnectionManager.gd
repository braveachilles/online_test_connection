extends Node
var networkPeer
var ip
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func connectToServer(ip):
	#ip = "201.214.181.228"
	var client = NetworkedMultiplayerENet.new()
	client.create_client(ip, 80)

func createServer():
	var server = NetworkedMultiplayerENet.new()
	server.create_server(80, 4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func sendMessage():
	print("connecting to server")
	networkPeer.put_var("message", "hello world")

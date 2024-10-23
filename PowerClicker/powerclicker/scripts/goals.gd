extends Control
var seconds_passed = 0;
var labelnode = null
var node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labelnode = get_node("Label")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(Globals.kWd>6458333333):
		labelnode.text = "Nu kan du producerar du 6458333333 kWd vilket är lika mycket som sverige under ett år"
	elif(Globals.kWd>65753424):
		labelnode.text = "Nu kan du driva Google som drar ca 65753424 kWd"
	elif(Globals.kWd>8333):
		labelnode.text ="Nu kan du driva en skola på 5 000 m2 som drar ungefär 8333 kWd. "
	elif(Globals.kWd>1042):
		labelnode.text = "Det krävs cirka 1042 kWh för att värma upp ett håshåll i ett år"
	elif(Globals.kWd>55):
		labelnode.text = "Nu kan du driva en villa i sverige som i genomsnitt drar 55 kWd"
	elif(Globals.kWd>0.6):
		labelnode.text = "Nu kan du driva en plasma TV med 400 Watt i timmen som drar 0.6 kWd"
	
	pass

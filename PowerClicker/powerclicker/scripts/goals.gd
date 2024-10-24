extends Control
var seconds_passed = 0;
var labelnode = null
var labelnode2 = null
var node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labelnode = get_node("Label")
	labelnode2 = get_node("Label2")
	pass # Replace withfunction body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(Globals.greenkWd>6458333333):
		labelnode.text = "You produce the green energy 6458333333 kWd which is tha same as Sweden during one year"
	elif(Globals.greenkWd>65753424):
		labelnode.text = "You produce the green energy to run Google"
	elif(Globals.greenkWd>28200):
		labelnode.text = "You produce the green energy to travel the Öresundslinje every day"
	elif(Globals.greenkWd>8333):
		labelnode.text ="You produce the green energy to run a school that is 5 000 m2"
	elif(Globals.greenkWd>32.8):
		labelnode.text = "You produce the green energy to heat a house"
	elif(Globals.greenkWd>0.6):
		labelnode.text = "You produce the green energy to use a plasma TV"
	
	
	if(Globals.CO2PerDay>28_800_000):
		labelnode2.text = "You now release as much CO2 as all the cars in sweden"
	elif(Globals.CO2PerDay>121000):
		labelnode2.text = "You now release as much CO2 as Sweden does"
	if(Globals.CO2PerDay>77000):
		labelnode2.text = "You now release as much CO2 per day as all privates boats in Sweden does in a year"
	

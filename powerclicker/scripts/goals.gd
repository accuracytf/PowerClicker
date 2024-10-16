extends Control
var seconds_passed = 0;
var labelnode = null
var node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	node = get_node("GoalTexts")
	node.visible = false
	labelnode = get_node("Label")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(Globals.kWd>65753424):
		node = get_node("GoalTexts/Label3")
		labelnode.text = node.text
	elif(Globals.kWd>8333):
		node = get_node("GoalTexts/Label2")
		labelnode.text = node.text
	elif(Globals.kWd>55):
		node = get_node("GoalTexts/Label1")
		labelnode.text = node.text
	elif(Globals.kWd>0.6):
		node = get_node("GoalTexts/Label0")
		labelnode.text = node.text
	
	pass

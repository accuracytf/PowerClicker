extends Control
var seconds_passed = 0;
var node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(4):
		node = get_node("VBoxContainer/Label" + str(i))
		node.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	var random = randi_range(0, 3)
	if(seconds_passed<10):
		node = get_node("VBoxContainer/Label" + str(random))
	seconds_passed += delta  # Increment seconds by the time since the last frame
	if seconds_passed >= 10:  # 5 seconds for one day
		node.visible = true
		if(seconds_passed >20):
			node.visible = false
			seconds_passed =0 # Reset seconds_passed for the next day
	
	pass

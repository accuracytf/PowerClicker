extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var clicked = false
var amount = 1
var progress_bar = get_node("../Top_container/ProgressBar")
progress_bar.min_value = 0
progress_bar.max_value = 100
progress_bar.value = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var labeltext = get_node("../Left_Container/Money")
	if(clicked == true): 
		Globals.Money += 1
		labeltext.text = "Money: " + str(Globals.Money)
		clicked = false
		progress_bar.value += 1
		

	
	pass

func _on_click() -> void:
	clicked = true
	pass # Replace with function body.

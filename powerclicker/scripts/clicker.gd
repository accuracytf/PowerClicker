extends Control

var clicked = false
var amount = 1
var progress_bar = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar = get_node("../../Top_container/Control/ProgressBar")
	progress_bar.min_value = 0
	progress_bar.max_value = 100
	progress_bar.value = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var labeltext = get_node("../../Left_Container/Money")
	if(clicked == true): 
		Globals.Money += 1
		labeltext.text = "Money: " + str(Globals.Money)
		progress_bar.value +=5
		clicked = false
		

	
	pass

func _on_click() -> void:
	clicked = true
	pass # Replace with function body.

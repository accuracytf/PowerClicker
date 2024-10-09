extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var clicked = false
var amount = 1;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(clicked == true): push_warning("hej")
	
	pass


func _on_button_pressed() -> void:
	clicked = true
	
	pass # Replace with function body.

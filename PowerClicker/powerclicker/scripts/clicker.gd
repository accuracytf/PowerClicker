extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_click() -> void:
	var labeltext = get_node("../../Left_Container/Money")
	Globals.money = Globals.money + 1
	labeltext.text = "Money: " + str(Globals.money)
	var click_sound = get_node("ClickSound")
	click_sound.play()

extends Control

var seconds_passed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	seconds_passed += delta  # Increment seconds by the time since the last frame
	if seconds_passed >= 1:  # 5 seconds for one day
		seconds_passed -= 1 # Reset seconds_passed for the next day
		_update_money()  # Update the label with the new date

func _update_money():
	Globals.money += Globals.kWd / 10
	get_node("Left_Container/Money").text = "Money: " + str(floor(Globals.money))

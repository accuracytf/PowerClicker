extends Control

var seconds_passed: float = 0.0

var CO2_absorbtion: float = 8_000_000_000 / 365
var CO2: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if (Globals.greenkWd >= Globals.maxenergy):
		Engine.time_scale = 0
		get_node("win_label").show()
	
	if (Globals.temperatureIncrease >= 1.5):
		get_node("lose_label").show()
		Engine.time_scale = 0
	
	seconds_passed += delta
	if seconds_passed >= 1:
		seconds_passed -= 1
		_update_money()
		
		CO2 += Globals.CO2PerDay
		CO2 -= CO2_absorbtion
		CO2 /= 2
		if CO2 < 0:
			CO2  = 0

		Globals.temperatureIncrease += (CO2 - 1_000_000_000)/365_000_000_000
		if Globals.temperatureIncrease < 0:
			Globals.temperatureIncrease = 0
		
		get_node("Temperature/Label").text = "+" + str(floor(Globals.temperatureIncrease * 10) / 10)
	
	

func _update_money():
	Globals.money += Globals.kWd / 10
	get_node("Left_Container/Info-Container/Money-Node/Money").text = Globals.suffix(floor(Globals.money))

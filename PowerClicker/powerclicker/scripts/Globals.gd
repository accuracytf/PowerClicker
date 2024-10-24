extends Node

var money : float = Varden.startMoney
var kWd : float = 0
var greenkWd : float = 0
var CO2PerDay : float = 0
var maxenergy : float = 105681000000000.0
var temperatureIncrease: float = 0


func suffix(value : float) -> String:
	var valor = ["", "K", "M", "B", "T", "Q", "QQ", "S", "SS", "OC", "N"]
	var valorIndex = 0
	
	while value > 1000:
		value = floor(value)
		valorIndex += 1
		value /= 10
		value = floor(value)
		value /= 100
	
	return str(value) + valor[valorIndex]


	

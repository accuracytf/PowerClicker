extends Control

class shopItem:
	var price: int
	var name: String
	var output: float
	var CO2_output: float
	var scale: float = 1.5
	var label: Label

var solar: shopItem
var wind: shopItem
var hydro: shopItem
var coal: shopItem
var gas: shopItem
var oil: shopItem

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

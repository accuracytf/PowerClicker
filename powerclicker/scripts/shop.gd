extends Control

class shopItem:
	var name: String
	var price: int
	var amount = 0
	var output: float
	var CO2_output: float
	var priceScale: float
	var container: TextureRect

var solar: shopItem = shopItem.new()
var wind: shopItem = shopItem.new()
var hydro: shopItem = shopItem.new()
var coal: shopItem = shopItem.new()
var gas: shopItem = shopItem.new()
var oil: shopItem = shopItem.new()
var buildings = [solar, wind, hydro, coal, gas, oil]

func _initShopitem(item: shopItem, name: String, price: int, output: float, CO2_output: float, priceScale: float, container: TextureRect):
	item.name = name
	item.price = price
	item.output = output
	item.CO2_output = CO2_output
	item.priceScale = priceScale
	item.container = container

func _updateLabel(item: shopItem):
	item.container.get_node("Label").text = item.name + " " + str(item.amount)
	item.container.get_node("Button").text = str(item.price) + " kr"


func _ready() -> void:
	
	_initShopitem(buildings[0], "Solar", 10, 10, 1, 1.1, $ScrollContainer_Green/VBoxContainer_Green/TextureRect_Solar)
	_initShopitem(buildings[1], "Wind Turbines", 100, 14500, 0.2, 1.3, $ScrollContainer_Green/VBoxContainer_Green/TextureRect_Wind)
	_initShopitem(buildings[2], "Hydroelectric", 1000, 89000, 0.75, 1.5, $ScrollContainer_Green/VBoxContainer_Green/Hydroelectric)
	_initShopitem(buildings[3], "Coal Powerplant", 100, 12000000, 13000000, 1.5, $ScrollContainer_Red/VBoxContainer_Red/TextureRect_Coal)
	_initShopitem(buildings[4], "Gas Powerplant", 100, 11520000, 5184000, 1.5, $ScrollContainer_Red/VBoxContainer_Red/TextureRect_Gas)
	_initShopitem(buildings[5], "Gas Powerplant", 100, 7200000, 5760000, 1.5, $ScrollContainer_Red/VBoxContainer_Red/TextureRect_Oil)
	
	for building in buildings:
		_updateLabel(building)
		building.container.get_node("Button").connect("pressed", Callable(self, "_which_button_pressed").bind(building))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _which_button_pressed(building: shopItem):
	if (Globals.money >= building.price):
		Globals.money -= building.price
		Globals.kWd += building.output
		Globals.CO2PerYear += building.CO2_output
		building.price *= building.priceScale
		building.amount += 1
		_updateLabel(building)

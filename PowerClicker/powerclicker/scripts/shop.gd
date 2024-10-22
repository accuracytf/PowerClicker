extends Control

class shopItem:
	var name: String
	var startPrice: float
	var price : float
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

var buyOne : bool = true

func _initShopitem(item: shopItem, name: String, price: int, output: float, CO2_output: float, priceScale: float, container: TextureRect):
	item.name = name
	item.price = price
	item.startPrice = price
	item.output = output
	item.CO2_output = CO2_output
	item.priceScale = priceScale
	item.container = container

func _updateLabel(item: shopItem):
	item.container.get_node("Label").text = item.name + " " + str(item.amount)
	item.container.get_node("Button").text = Globals.suffix(ceil(item.price)) + "kr"

func _buyOne(building: shopItem, playSound: bool = true): 
	if (Globals.money >= building.price):
		if playSound:
			var sound = get_node("SuccessSound")
			sound.play()
		Globals.money -= building.price
		if building.name == "solar" or building.name == "Wind Turbines" or building.name == "Hydroelectric":
			Globals.greenkWd += building.output
		Globals.kWd += building.output
		Globals.CO2PerDay += building.CO2_output
		building.price += building.priceScale * building.startPrice
		building.amount += 1
		_updateLabel(building)
	else:
		var sound = get_node("ErrorSound")
		sound.play()

func _buyMax(building: shopItem):
	var m : float = building.price
	var k : float = building.startPrice * building.priceScale
	var sum : float = Globals.money
	
	var a : float = k
	var b : float = 2 * m+k
	var c : float = 2 * m - 2 * sum
	
	print(a)
	print(b)
	print(c)
	
	print(sqrt(pow(b, 2) - 4 * a * c))
	
	var x : int = floor((-b + sqrt(pow(b, 2) - 4 * a * c)) / (2 * a)) + 1
	
	if  x == 0:
		var sound = get_node("ErrorSound")
		sound.play()
		return
	
	var totalPrice : float = (x) * (2 * m + k * (x - 1)) / 2
	
	Globals.money -= totalPrice
	if building.name == "solar" or building.name == "Wind Turbines" or building.name == "Hydroelectric":
		Globals.greenkWd += building.output * x
	Globals.kWd += building.output * x
	Globals.CO2PerDay += building.CO2_output * x
	building.price += building.priceScale * building.startPrice * x
	building.amount += 1 * x
	_updateLabel(building)
	

func _ready() -> void:
	
	_initShopitem(buildings[0], "Solar", Varden.solarPrice, 10, 0, Varden.solarScale, $ScrollContainer_Green/VBoxContainer_Green/TextureRect_Solar)
	_initShopitem(buildings[1], "Wind Turbines", Varden.windPrice, 14500, 0, Varden.windScale, $ScrollContainer_Green/VBoxContainer_Green/TextureRect_Wind)
	_initShopitem(buildings[2], "Hydroelectric", Varden.hydroPrice, 89000, 0, Varden.hydroScale, $ScrollContainer_Green/VBoxContainer_Green/Hydroelectric)
	_initShopitem(buildings[3], "Coal Powerplant", Varden.coalPrice, 12000000, 13000, Varden.coalScale, $ScrollContainer_Red/VBoxContainer_Red/TextureRect_Coal)
	_initShopitem(buildings[4], "Gas Powerplant", Varden.gasPrice, 11520000, 5184, Varden.gasScale, $ScrollContainer_Red/VBoxContainer_Red/TextureRect_Gas)
	_initShopitem(buildings[5], "Oil Powerplant", Varden.oilPrice, 7200000, 5760, Varden.oilScale, $ScrollContainer_Red/VBoxContainer_Red/TextureRect_Oil)
	
	for building in buildings:
		_updateLabel(building)
		building.container.get_node("Button").connect("pressed", Callable(self, "_buy_button_pressed").bind(building))
		building.container.get_node("Button2").connect("pressed", Callable(self, "_sell_button_pressed").bind(building))


func _buy_button_pressed(building: shopItem):
	
	if buyOne:
		_buyOne(building)
	else:
		_buyMax(building)


func _sell_button_pressed(building: shopItem):
	if (building.amount > 0):
		var sound = get_node("SuccessSound") ## Behöver nytt ljud för att sälja något
		sound.play()
		if building.name == "solar" or building.name == "Wind Turbines" or building.name == "Hydroelectric":
			Globals.greenkWd -= building.output
			
		Globals.kWd -= building.output
		Globals.CO2PerDay -= building.CO2_output
		building.amount -= 1
		_updateLabel(building)
	else:
		var sound = get_node("ErrorSound")
		sound.play()



func _on_buy_max_pressed() -> void:
	buyOne = false


func _on_buy_one_pressed() -> void:
	buyOne = true

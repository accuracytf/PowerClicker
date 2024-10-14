extends Control

class shopItem:
	var name: String
	var price: int
	var amount = 0
	var output: float
	var CO2_output: float
	var priceScale: float
	var label: Label

var solar: shopItem = shopItem.new()
var wind: shopItem = shopItem.new()
var hydro: shopItem = shopItem.new()
var coal: shopItem = shopItem.new()
var gas: shopItem = shopItem.new()
var oil: shopItem = shopItem.new()

func _initShopitem(item: shopItem, name: String, price: int, output: float, CO2_output: float, priceScale: float, label: Label):
	item.name = name
	item.price = price
	item.output = output
	item.CO2_output = CO2_output
	item.priceScale = priceScale
	item.label = label

func _updateLabel(item: shopItem):
	item.label.text = item.name + " " + str(item.amount)


func _ready() -> void:
	
	_initShopitem(solar, "solar", 10, 10, 10, 1.5, $ScrollContainer_Green/VBoxContainer_Green/TextureRect_Solar/Label)
	_updateLabel(solar)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Control

# Reference to the ProgressBar using @onready
@onready var label = $Label 


var timer: float = 0.0
var procentage: float = 0.0

func _ready() -> void:
	label.text = "0"
	# Initialize the ProgressBar


func _process(delta: float) -> void:
	# Update the timer
	timer += delta
	if(timer>=0.5): 
		timer =- 0.5
		procentage += Globals.kWd/Globals.maxenergy
		label.text = str(procentage) 
		
	

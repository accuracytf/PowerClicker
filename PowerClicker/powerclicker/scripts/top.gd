extends Control

# Reference to the ProgressBar using @onready
@onready var label = $Label 


var timer: float = 0.0
var duration: float = 10.0  # Duration for the progress to complete (in seconds)
var procentage: float = 0.0

func _ready() -> void:
	label.text = "hej"
	# Initialize the ProgressBar


func _process(delta: float) -> void:
	# Update the timer
	timer += delta
	if(timer>=1): 
		procentage += Globals.kWd/Globals.maxenergy
		label.text = "You have produced \n" + str(procentage) + "\nof the energy requiered for the whole world during 1 year";
		timer =- 1
	

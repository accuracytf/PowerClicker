extends Control

# Reference to the ProgressBar using @onready
@onready var progress_bar = $ProgressBar 
@onready var progress_bar1 = $ProgressBar2
@onready var progress_bar2 = $ProgressBar3

var timer: float = 0.0
var duration: float = 10.0  # Duration for the progress to complete (in seconds)

func _ready() -> void:
	# Initialize the ProgressBar
	progress_bar.min_value = 0
	progress_bar.max_value = 100
	progress_bar.value = 0
	progress_bar1.min_value = 0
	progress_bar1.max_value = 100
	progress_bar1.value = 0
	progress_bar2.min_value = 0
	progress_bar2.max_value = 100
	progress_bar2.value = 0

func _process(delta: float) -> void:
	# Update the timer
	timer += delta
	
	# Calculate the current progress percentage
	if timer <= duration:
		var progress_percentage = (timer / duration) * 100
		progress_bar.value = progress_percentage  # Update the ProgressBar value
		progress_bar1.value = progress_percentage  
		progress_bar2.value = progress_percentage  
	else:
		progress_bar.value = 100  # Set to maximum when done
		progress_bar1.value = 100  
		progress_bar2.value = 100  

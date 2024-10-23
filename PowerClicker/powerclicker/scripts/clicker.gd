extends Control

var clicks: int = 0
var seconds_passed: float = 0
var animation: AnimatedSprite2D
var wheel: Control
var wheel_rotation: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation = get_parent().get_node("Hamter_animation")
	wheel = get_parent().get_node("Clicker")
	
	animation.play("run")
	animation.set_speed_scale(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	seconds_passed += delta  # Increment seconds by the time since the last frame
	if seconds_passed >= 0.25:
		seconds_passed -= 0.25
		animation.set_speed_scale(sqrt(clicks*2))
		
		wheel_rotation += clicks
		if wheel_rotation > 36:
			wheel_rotation -= 36
		wheel.set_rotation_degrees(wheel_rotation*10)
		
		
		clicks = 0

func _on_click() -> void:
	var labeltext = get_node("../../Left_Container/Info-Container/Money-Node/Money")
	Globals.money = Globals.money + 1
	labeltext.text = Globals.suffix(Globals.money)
	var click_sound = get_node("ClickSound")
	click_sound.play()
	clicks += 1

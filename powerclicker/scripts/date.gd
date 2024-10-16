extends Node

var seconds_passed: float = 0.0  # Total seconds elapsed
var days_passed: int = 0          # Days counter
var start_day: int = 5            # Starting day (5th)
var start_month: int = 6          # Starting month (June)
var start_year: int = 2024        # Starting year (2024)

func _process(delta: float) -> void:
	seconds_passed += delta  # Increment seconds by the time since the last frame
	if seconds_passed >= 0.2:  # 5 seconds for one day
		days_passed += 1
		seconds_passed -= 0.2 # Reset seconds_passed for the next day
		update_label()  # Update the label with the new date

func update_label() -> void:
	var current_date = calculate_date(start_day, start_month, start_year, days_passed)
	var label = get_node("Date_Label")
	label.text = "Date: " + current_date

func calculate_date(start_day: int, start_month: int, start_year: int, days_passed: int) -> String:
	# Calculate the current date
	var current_day = start_day + days_passed
	var current_month = start_month
	var current_year = start_year

	# Handle month and year overflow
	while current_day > days_in_month(current_month, current_year):
		current_day -= days_in_month(current_month, current_year)
		current_month += 1
		if current_month > 12:
			current_month = 1
			current_year += 1

	return str(current_day) + "/" + str(current_month) + "/" + str(current_year)

func days_in_month(month: int, year: int) -> int:
	if month == 2:
		# Check for leap year
		if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
			return 29  # Leap year
		else:
			return 28  # Non-leap year
	elif month in [4, 6, 9, 11]:
		return 30  # April, June, September, November
	else:
		return 31  # January, March, May, July, August, October, December

extends MotionState

@export() var moving_speed = 0.0

func init(_data: Dictionary={}) -> void:
	player.current_speed = moving_speed

func handle_input(_event) -> void:
	wasd_update()

	if Input.is_action_pressed("crouch"):
		emit_signal("change_state_request", "Crouch")
	elif Input.is_action_just_pressed("jump") and can_jump():
		emit_signal("change_state_request", "Jump")

	# Getting motion when user press WASD
	elif not player.input_direction.is_zero_approx():
		if Input.is_action_pressed("sprint"):
			emit_signal("change_state_request", "Sprint")
		else:
			emit_signal("change_state_request", "Walk")

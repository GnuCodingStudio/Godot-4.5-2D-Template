extends Node


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var buttonEvent := event as InputEventMouseButton
		var isFocused := not get_window().has_focus() or Input.mouse_mode != Input.MOUSE_MODE_CAPTURED
		if buttonEvent.is_pressed() and isFocused:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			get_window().grab_focus()
	elif event is InputEventKey:
		var keyEvent := event as InputEventKey
		if keyEvent.is_pressed() and keyEvent.keycode == KEY_ESCAPE:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

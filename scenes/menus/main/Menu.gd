extends VBoxContainer


func animate_buttons_appearance(delay_before_start: float, delay_between_buttons: float, x_displacement: float) -> void:
	for button in get_children():
		if button is Button:
			button.modulate.a = 0
	
	if delay_before_start > 0:
		await get_tree().create_timer(delay_before_start).timeout
	
	var is_first := true
	for button in get_children():
		if button is Button:
			if is_first:
				is_first = false
				button.grab_focus()
			button.global_position.x += x_displacement
			var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
			tween.tween_property(button, "position:x", 0, 0.5)
			tween.parallel().tween_property(button, "modulate:a", 1.0, 0.5)
			
			if delay_between_buttons > 0:
				await get_tree().create_timer(delay_between_buttons).timeout

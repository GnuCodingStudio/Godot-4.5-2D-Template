extends VBoxContainer

# Cette classe gère les animations des boutons dans un menu

# Appelé pour animer l'apparition des boutons avec un effet de glissement + fade
func animate_buttons_appearance(delay_before_start := 0.0, delay_between_buttons := 0.2):
	# Cacher initialement tous les boutons
	for button in get_children():
		if button is Button:
			button.modulate.a = 0
			button.position.x = -100
	
	# Attendre avant de commencer si nécessaire
	if delay_before_start > 0:
		await get_tree().create_timer(delay_before_start).timeout
	
	# Animer chaque bouton séquentiellement
	var last_tween
	for button in get_children():
		if button is Button:
			var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
			tween.tween_property(button, "position:x", 0, 0.5)
			tween.parallel().tween_property(button, "modulate:a", 1.0, 0.5)
			last_tween = tween
			
			# Attendre entre les animations si ce n'est pas le dernier bouton
			if button != get_children().back() and delay_between_buttons > 0:
				await get_tree().create_timer(delay_between_buttons).timeout
	
	# Retourne le dernier tween pour permettre d'attendre la fin des animations
	return last_tween

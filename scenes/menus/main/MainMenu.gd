extends Control

@onready var quit_dialog = %QuitDialog
@onready var start_button: Button = %StartButton
@onready var menu = %Menu

func _ready():
	ProgressionService.init()
	menu.animate_buttons_appearance(0.4, 0.2, -100)


func _on_start_button_pressed():
	print("Start button clicked")


func _on_settings_button_pressed() -> void:
	SceneTransition.change_scene("res://scenes/menus/settings/SettingsMenu.tscn")


func _on_credits_button_pressed():
	SceneTransition.change_scene("res://scenes/menus/credits/CreditsMenu.tscn")


func _on_quit_button_pressed():
	_ask_to_confirm_quit()


func _on_quit_dialog_confirmed():
	get_tree().quit()


func _ask_to_confirm_quit():
	quit_dialog.pop_in()

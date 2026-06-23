extends Control

@onready var audio_master_slider: HSlider = %AudioMasterSlider
@onready var music_master_slider: HSlider = %MusicMasterSlider
@onready var ui_master_slider: HSlider = %UiMasterSlider
@onready var sfx_master_slider: HSlider = %SfxMasterSlider

func _ready() -> void:
	audio_master_slider.set_value_no_signal(AudioServer.get_bus_volume_linear(0))
	music_master_slider.set_value_no_signal(AudioServer.get_bus_volume_linear(1))
	ui_master_slider.set_value_no_signal(AudioServer.get_bus_volume_linear(2))
	sfx_master_slider.set_value_no_signal(AudioServer.get_bus_volume_linear(3))

#region signals

func _on_audio_slider_value_changed(value: float, idx: int) -> void:
	AudioServer.set_bus_volume_linear(idx, value)

func _on_back_button_pressed() -> void:
	SceneTransition.change_scene("res://scenes/menus/main/MainMenu.tscn")

#endregion signals

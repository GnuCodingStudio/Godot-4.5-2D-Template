extends Control

@onready var audio_master_slider: HSlider = %AudioMasterSlider
@onready var audio_music_slider: HSlider = %AudioMusicSlider
@onready var audio_ui_slider: HSlider = %AudioUiSlider
@onready var audio_sfx_slider: HSlider = %AudioSfxSlider


func _ready() -> void:
	audio_master_slider.set_value_no_signal(AudioServer.get_bus_volume_linear(AudioSettingsService.MASTER))
	audio_music_slider.set_value_no_signal(AudioServer.get_bus_volume_linear(AudioSettingsService.MUSIC))
	audio_ui_slider.set_value_no_signal(AudioServer.get_bus_volume_linear(AudioSettingsService.UI))
	audio_sfx_slider.set_value_no_signal(AudioServer.get_bus_volume_linear(AudioSettingsService.SFX))

#region signals

func _on_audio_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioSettingsService.MASTER, value)
	AudioSettingsService.data.master = value
	AudioSettingsService.save(AudioSettingsService.data)

func _on_audio_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioSettingsService.MUSIC, value)
	AudioSettingsService.data.music = value
	AudioSettingsService.save(AudioSettingsService.data)

func _on_audio_ui_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioSettingsService.UI, value)
	AudioSettingsService.data.ui = value
	AudioSettingsService.save(AudioSettingsService.data)

func _on_audio_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioSettingsService.SFX, value)
	AudioSettingsService.data.sfx = value
	AudioSettingsService.save(AudioSettingsService.data)

func _on_back_button_pressed() -> void:
	SceneTransition.change_scene("res://scenes/menus/main/MainMenu.tscn")

#endregion signals

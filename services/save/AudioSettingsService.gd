extends Node

var dir_path := "user://saves/"
var filename := "audio.json"

var data: AudioSettings

const MASTER := 0
const MUSIC := 1
const UI := 2
const SFX := 3

func init() -> void:
	DirAccess.make_dir_recursive_absolute(dir_path)
	data = _load()
	AudioServer.set_bus_volume_linear(MASTER, data.master)
	AudioServer.set_bus_volume_linear(MUSIC, data.music)
	AudioServer.set_bus_volume_linear(UI, data.ui)
	AudioServer.set_bus_volume_linear(SFX, data.sfx)

func save(settings: AudioSettings) -> void:
	data = settings
	
	var content := _serialize(settings)
	var file := FileAccess.open(dir_path + filename, FileAccess.WRITE)
	file.store_string(content)
	file.close()


func clear() -> void:
	DirAccess.remove_absolute(dir_path + filename)


func _load() -> AudioSettings:
	if FileAccess.file_exists(dir_path + filename):
		var file := FileAccess.open(dir_path + filename, FileAccess.READ)
		var loaded_data: AudioSettings = _parse(file.get_as_text())
		file.close()
		return loaded_data
	else:
		return AudioSettings.new()


func _serialize(settings: AudioSettings) -> String:
	return JSON.stringify({
		"master": settings.master,
		"music": settings.music,
		"ui": settings.ui,
		"sfx": settings.sfx
	})


func _parse(json: String) -> AudioSettings:
	var dict: Dictionary = JSON.parse_string(json)
	var settings: AudioSettings = AudioSettings.new()
	settings.master = dict["master"]
	settings.music = dict["music"]
	settings.ui = dict["ui"]
	settings.sfx = dict["sfx"]
	return settings

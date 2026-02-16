class_name Bridge
extends Node3D

@onready var platform_3: Platform = %Platform3
@onready var platform_4: Platform = %Platform4


signal on_player_detected(player: Player)


func set_valid() -> void:
	_set_last_platforms_collision(true)

func set_invalid() -> void:
	_set_last_platforms_collision(false)

func _set_last_platforms_collision(enabled: bool) -> void:
	platform_3.enable_collistion(enabled)
	platform_4.enable_collistion(enabled)

#region signals

func _on_body_detected(body: Node3D) -> void:
	if body is Player:
		on_player_detected.emit(body)

#endregion signals

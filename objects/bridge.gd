class_name Bridge
extends Node3D


signal on_player_detected(player: Player)


func _on_body_detected(body: Node3D) -> void:
	if body is Player:
		on_player_detected.emit(body)

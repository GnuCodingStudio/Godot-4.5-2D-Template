class_name Bridge
extends Node3D

@export var previous_room: Room
@export var next_room: Room


func _on_body_detected(body: Node3D) -> void:
	if body is Player:
		previous_room.close_exit_doors()
		next_room.open_enter_doors()
		body.clear_hud()

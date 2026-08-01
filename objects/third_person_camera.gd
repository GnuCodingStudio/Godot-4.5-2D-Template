class_name CameraPivot
extends Node3D

@export_range(0.0, 1.0) var mouse_sensitivity: float = 0.01
@export var tilt_limit: float = deg_to_rad(75)

@onready var camera: Camera3D = %Camera


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouseMotion := event as InputEventMouseMotion
		self.rotation.x -= mouseMotion.screen_relative.y * mouse_sensitivity
		self.rotation.x = clampf(self.rotation.x, -tilt_limit, tilt_limit)
		self.rotation.y += -mouseMotion.screen_relative.x * mouse_sensitivity

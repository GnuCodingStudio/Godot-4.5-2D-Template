class_name Platform
extends StaticBody3D

@onready var collision_shape: CollisionShape3D = %CollisionShape


func enable_collistion(enabled: bool) -> void:
	call_deferred("_enable_collistion", enabled)

func _enable_collistion(enabled: bool) -> void:
	collision_shape.disabled = !enabled

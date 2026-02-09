extends StaticBody3D

@onready var wall_door_rotate: Node3D = $"wall-door-rotate"
@onready var closed_shape: CollisionShape3D = $ClosedShape
@onready var open_shape_1: CollisionShape3D = $OpenShape1
@onready var open_shape_2: CollisionShape3D = $OpenShape2

func _ready() -> void:
	open()

func open() -> void:
	wall_door_rotate.get_node("AnimationPlayer").play("open")
	closed_shape.disabled = true
	open_shape_1.disabled = false
	open_shape_2.disabled = false

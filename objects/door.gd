extends StaticBody3D

@onready var wall_door_rotate: Node3D = $"wall-door-rotate"

func _ready() -> void:
	wall_door_rotate.get_node("AnimationPlayer").play("open")

class_name Door
extends StaticBody3D

@onready var wall_door_rotate: Node3D = $"wall-door-rotate"
@onready var closed_shape: CollisionShape3D = %ClosedShape
@onready var open_shape_1: CollisionShape3D = %OpenShape1
@onready var open_shape_2: CollisionShape3D = %OpenShape2
@onready var operation: Label3D = %Operation

var is_opened: bool = false


func _ready() -> void:
	pass

func open() -> void:
	if is_opened: return
	
	wall_door_rotate.get_node("AnimationPlayer").play("open")
	call_deferred("_toggle_state", true)

func close() -> void:
	if not is_opened: return
	
	wall_door_rotate.get_node("AnimationPlayer").play("close")
	call_deferred("_toggle_state", false)

func set_operation(operation: String) -> void:
	self.operation.text = operation

func _toggle_state(opened: bool):
	is_opened = opened
	closed_shape.disabled = opened
	open_shape_1.disabled = !opened
	open_shape_2.disabled = !opened

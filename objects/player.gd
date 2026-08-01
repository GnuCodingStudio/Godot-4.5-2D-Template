extends CharacterBody3D

@onready var model: MeshInstance3D = %Player
@onready var camera_pivot: CameraPivot = %CameraPivot

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var camera := get_viewport().get_camera_3d().global_transform
	var direction := transform.basis * camera.basis * Vector3(input_dir.x, 0, input_dir.y)
	direction.y = 0.0
	direction = direction.normalized()
	
	model.rotation.y = camera_pivot.rotation.y
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

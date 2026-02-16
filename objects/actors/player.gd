class_name Player
extends CharacterBody3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var mouse_sensitivity = 0.15
@export var move_speed = 5.0
@export var rotation_speed = 10.0

@onready var camera_node: Node3D = $CameraNode
@onready var hud_label: Label = %HudLabel

var camera_rotation_x = 0.0


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		var mouse_delta = event.relative
		
		rotate_y(deg_to_rad(-mouse_delta.x * mouse_sensitivity))
		
		camera_rotation_x -= mouse_delta.y * mouse_sensitivity
		camera_rotation_x = clamp(camera_rotation_x, -90, 90)
		camera_node.rotation_degrees.x = camera_rotation_x
	
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0
	
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if input_dir != Vector2.ZERO:
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		velocity.x = direction.x * move_speed
		velocity.z = direction.z * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed * delta * 3.0)
		velocity.z = move_toward(velocity.z, 0, move_speed * delta * 3.0)
	
	move_and_slide()


func show_hud(message: String) -> void:
	hud_label.text = message

func clear_hud() -> void:
	hud_label.text = ""

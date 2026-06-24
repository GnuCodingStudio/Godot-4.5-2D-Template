extends RigidBody2D
class_name Actor

@export var speed := 300.0

@onready var animated_sprite: AnimatedSprite2D = %AnimatedSprite
@onready var collision_shape: CollisionShape2D = %CollisionShape


var state := State.IDLE:
	set(value):
		if state != value:
			state = value
			_on_state_changed()

var moving_direction := Vector2.ZERO:
	set(value):
		if moving_direction != value:
			moving_direction = value
			_on_moving_direction_changed()

var facing_direction := Vector2.DOWN:
	set(value):
		if facing_direction != value:
			facing_direction = value
			_on_facing_direction_changed()


enum State {
	IDLE,
	MOVING
}


func _process(_delta: float) -> void:
	if moving_direction == Vector2.ZERO:
		state = State.IDLE
	else:
		state = State.MOVING


func _physics_process(delta: float) -> void:
	move_and_collide(moving_direction * speed * delta)


func _direction_name() -> String:
	match facing_direction:
		Vector2.UP: return "Up"
		Vector2.DOWN: return "Down"
		Vector2.LEFT: return "Left"
		Vector2.RIGHT: return "Right"
		_: return "Down"


func _update_animation() -> void:
	var state_name := ""
	match state:
		State.IDLE: state_name = "Idle"
		State.MOVING: state_name = "Move"

	var animation_name := state_name + _direction_name()
	animated_sprite.play(animation_name)


func _on_state_changed() -> void:
	_update_animation()


func _on_moving_direction_changed() -> void:
	if moving_direction == Vector2.ZERO or moving_direction == facing_direction:
		return

	var x_sign := signf(moving_direction.x)
	var y_sign := signf(moving_direction.y)

	if facing_direction.x == x_sign:
		facing_direction = Vector2(0, y_sign)
	elif facing_direction.y == y_sign:
		facing_direction = Vector2(x_sign, 0)
	else:
		facing_direction = moving_direction


func _on_facing_direction_changed() -> void:
	_update_animation()

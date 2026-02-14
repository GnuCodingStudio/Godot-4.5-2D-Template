extends Node3D

@onready var room_1: Room = %Room1
@onready var room_2: Room = %Room2


func _ready() -> void:
	room_1.open_enter_doors()
	room_1.player_on_bridge.connect(_open_room_2)


func _open_room_2(_player: Player) -> void:
	room_2.open_enter_doors()

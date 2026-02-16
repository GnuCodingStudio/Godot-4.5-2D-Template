extends Node3D

@onready var room_1: Room = %Room1

const ROOM = preload("res://objects/room.tscn")


func _ready() -> void:
	room_1.open_enter_doors()
	
	var previous = room_1
	for i in 5:
		previous = _add_room_after(previous)

func _add_room_after(previous: Room) -> Room:
	var new_room: Room = ROOM.instantiate()
	add_child(new_room)
	new_room.global_position = previous.get_end_global_position()
	previous.player_on_bridge.connect(func (_p): new_room.open_enter_doors())
	return new_room

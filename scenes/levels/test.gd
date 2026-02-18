extends Node3D

@onready var room_1: Room = %Room1

const ROOM = preload("res://objects/room.tscn")

var _rooms: Array[Room] = []


func _ready() -> void:
	room_1.open_enter_doors()
	_rooms.push_back(room_1)
	
	var previous = room_1
	for i in 2:
		previous = _add_room_after(previous)

func _add_room_after(previous: Room) -> Room:
	var new_room: Room = ROOM.instantiate()
	add_child(new_room)
	new_room.global_position = previous.get_end_global_position()
	new_room.player_entered.connect(_generate_new_room)
	previous.player_on_bridge.connect(func (_p): new_room.open_enter_doors())
	
	_rooms.push_back(new_room)
	return new_room

func _generate_new_room(_player: Player) -> void:
	prints("_generate_new_room")
	var room_to_remove = _rooms.pop_front()
	var last_room = _rooms.back()
	
	room_to_remove.free()
	_add_room_after(last_room)

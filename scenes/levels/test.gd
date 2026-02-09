extends Node3D

@onready var room_1: Room = $Room1


func _ready() -> void:
	room_1.open_enter_doors()

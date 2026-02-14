class_name Room
extends Node3D

@onready var exit_door_1: Door = %ExitDoor1
@onready var exit_door_2: Door = %ExitDoor2
@onready var exit_door_3: Door = %ExitDoor3
@onready var enter_door_1: Door = %EnterDoor1
@onready var enter_door_2: Door = %EnterDoor2
@onready var enter_door_3: Door = %EnterDoor3


var result: int


func _ready() -> void:
	result = randi_range(5, 95)
	var right_door = randi_range(0, 2)
	var doors = [exit_door_1, exit_door_2, exit_door_3]
	
	for d in 3:
		var operand1 = randi_range(0, result)
		var operand2 = result - operand1
		
		if right_door != d:
			operand2 += randi_range(10, 30)
			
		doors[d].set_operation("%d + %d" % [operand1, operand2])

func open_enter_doors() -> void:
	enter_door_1.open()
	enter_door_2.open()
	enter_door_3.open()
	
func close_enter_doors() -> void:
	enter_door_1.close()
	enter_door_2.close()
	enter_door_3.close()
	
func open_exit_doors() -> void:
	exit_door_1.open()
	exit_door_2.open()
	exit_door_3.open()
	
func close_exit_doors() -> void:
	exit_door_1.close()
	exit_door_2.close()
	exit_door_3.close()


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		close_enter_doors()
		open_exit_doors()
		body.show_hud("? = %d" % result)

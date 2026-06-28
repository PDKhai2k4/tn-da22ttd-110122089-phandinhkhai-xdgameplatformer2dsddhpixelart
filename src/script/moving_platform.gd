extends Node2D

@export var speed := 30.0

@onready var platform = $Platform
@onready var start_point = $StartPoint.global_position
@onready var end_point = $EndPoint.global_position

var target_position
var active = false


func _ready():

	target_position = end_point


func _physics_process(delta):

	if !active:
		return

	platform.global_position = platform.global_position.move_toward(
		target_position,
		speed * delta
	)

	if platform.global_position.distance_to(target_position) < 2:

		if target_position == end_point:
			target_position = start_point
		else:
			target_position = end_point


func activate():

	active = true

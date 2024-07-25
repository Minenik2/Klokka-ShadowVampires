extends Node2D

@export var laser_beam_scene: PackedScene
@export var laser_direction: Vector2 = Vector2.RIGHT
@export var offset: float = 5.0  # Offset distance to spawn the laser

func _ready():
	shoot_laser()

func shoot_laser():
	var laser_instance = laser_beam_scene.instantiate()
	add_child(laser_instance)
	laser_instance.position = global_position + laser_direction.normalized() * offset
	laser_instance.direction = laser_direction
	laser_instance.activate_laser()

extends Node2D

@export var laser_beam_scene: PackedScene
@export var laser_direction: Vector2 = Vector2.RIGHT
@export var offset: float = 5.0  # Offset distance to spawn the laser
var is_active = false
var laser_instance

func _ready():
	shoot_laser()
	set_physics_process(false) # Initially disable physics processing
	#update_laser_visual()

func shoot_laser():
	laser_instance = laser_beam_scene.instantiate()
	add_child(laser_instance)
	#laser_instance.position = global_position
	laser_instance.direction = laser_direction
	

func update_laser_visual():
	laser_instance.update_laser_visual()

func activate_laser():
	is_active = true
	set_physics_process(true)
	update_laser_visual()

func deactivate_laser():
	is_active = false
	set_physics_process(false)
	update_laser_visual()

func _physics_process(delta):
	if is_active:
		# Handle laser behavior while active
		pass


func OnBodyEntered(body_rid, body, body_shape_index, local_shape_index):
	if(body.HasMethod()):
		body.call
	pass # Replace with function body.

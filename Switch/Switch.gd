extends StaticBody2D

@export var laser_beam_scene: Node2D
@onready var sprite = $Sprite2D
@onready var laser = get_node("../Laser") # Adjust the path to your laser node if different
var is_on = false


func _ready():
	print(laser)
	update_switch_visual()

func update_switch_visual(): 
	if is_on:
		sprite.frame = 0 
	else:
		sprite.frame = 1

func flip_switch():
	is_on = !is_on
	update_switch_visual()
	update_laser()
	
func update_laser():
	if !laser_beam_scene.is_active:
		#laser.activate_laser()
		laser_beam_scene.activate_laser()
	else:
		#laser.deactivate_laser()
		laser_beam_scene.deactivate_laser()
		
# func _ready():
#   if target_node:
#       target_node.perform_action()  # Call the method on the exported node
#   else:
#       print("Target node is not assigned!")


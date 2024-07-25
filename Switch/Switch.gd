extends StaticBody2D

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
	if is_on:
		laser.activate_laser()
	else:
		laser.deactivate_laser()


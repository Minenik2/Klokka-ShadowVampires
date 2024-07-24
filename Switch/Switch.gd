extends StaticBody2D

@onready var sprite = $Sprite2D
var is_on = false


func _ready():
	update_switch_visual()

func update_switch_visual(): 
	if is_on:
		sprite.frame = 0 
	else:
		sprite.frame = 1

func flip_switch():
	is_on = !is_on
	update_switch_visual()


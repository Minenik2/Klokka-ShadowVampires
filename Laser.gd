extends StaticBody2D

var is_active = false

func _ready():
	set_physics_process(false) # Initially disable physics processing
	update_laser_visual()

func update_laser_visual():
	$Sprite2D.visible = is_active
	$CollisionShape2D.disabled = not is_active

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

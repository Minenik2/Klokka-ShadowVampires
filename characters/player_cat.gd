extends CharacterBody2D

@export var move_speed : float = 50
@export var starting_direction : Vector2 = Vector2(0, 1)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

var interact_key = "interact" # The key for interaction, usually set to "E" or "Enter"
var interaction_radius = 10

func _ready():
	update_animation_parameters(starting_direction)

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	
	update_animation_parameters(input_direction)
	velocity = input_direction * move_speed
	
	move_and_slide()
	pick_new_state()
	
	if Input.is_action_just_pressed(interact_key):
		interact()

func update_animation_parameters(move_input : Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/walk/blend_position", move_input)
		animation_tree.set("parameters/idle/blend_position", move_input)
		
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")


   

func interact():
	var space_state = get_world_2d().direct_space_state
	var query_shape = CircleShape2D.new()
	query_shape.radius = interaction_radius
	var query_params = PhysicsShapeQueryParameters2D.new()
	query_params.set_shape(query_shape)
	query_params.set_transform(global_transform)
	query_params.set_collision_mask(1)
	var result = space_state.intersect_shape(query_params)
	
	for collider in result:
		if collider.collider.has_method("flip_switch"):
			print("flipping Switch:", collider.collider)
			collider.collider.flip_switch() 
			break # Stop after the first switch is flipped







   

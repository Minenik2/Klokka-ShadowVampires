# IndefiniteLine.gd
extends Node2D

@export var line_width: float = 10.0
@export var line_color: Color = Color.CADET_BLUE
@export var direction: Vector2 = Vector2.RIGHT
@export var is_active: bool = true
@export var rotate: int = 90

var line_length: float = 0.0
var line_visual: Line2D


func _ready():
	# Ensure RayCast2D node is correctly initialized
	var raycast = $RayCast2D as RayCast2D
	if raycast:
		#raycast.cast_to = direction.normalized() * 10000  # Set a long cast distance
		raycast.enabled = true
	else:
		print("Error: RayCast2D node is missing or not properly initialized.")

	# Create and configure Line2D
	line_visual = Line2D.new()
	add_child(line_visual)
	line_visual.width = line_width
	line_visual.default_color = line_color
	
	line_visual.visible = is_active
	$CollisionShape2D.disabled = not is_active

func _process(delta):
	var raycast = $RayCast2D as RayCast2D
	if raycast:
		if raycast.is_colliding():
			var collision_point = raycast.get_collision_point()
			line_length = global_position.distance_to(collision_point)
			# Configure the CollisionShape2D
			$CollisionShape2D.shape = RectangleShape2D.new()
			$CollisionShape2D.rotation_degrees = rotate
			$CollisionShape2D.shape.extents = Vector2(line_length, line_width)
			#$CollisionShape2D.clear_points()
			#$CollisionShape2D.add_point(Vector2.ZERO)
			#$CollisionShape2D.add_point(direction.normalized() * line_length)

		else:
			line_length = 10000  # Default long length
		
		update_line_visual()
	else:
		print("Error: RayCast2D node is missing or not properly initialized.")

func update_line_visual():
	line_visual.clear_points()
	line_visual.add_point(Vector2.ZERO)
	line_visual.add_point(direction.normalized() * line_length)
	
func update_laser_visual():
	is_active = !is_active
	line_visual.visible = is_active
	$CollisionShape2D.disabled = not is_active

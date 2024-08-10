extends CharacterBody2D

@export var rover_speed = 325
@export var acceleration = 5
var min_angle = 240
var max_angle = 300
var rotating_right= true
var movement = 0
@onready var line_2d_pos = $RayCast2D/Line2D.get_point_position(1)
@onready var ray = $RayCast2D
func _physics_process(delta):
	#rover movement
	if velocity==Vector2.ZERO:
		movement = 0
		velocity = Vector2.ZERO
	velocity = Vector2.ZERO
	var direction_x = Input.get_axis("move_left","move_right")
	if direction_x !=0 && movement !=0:
		rotation += .6 *direction_x *delta
	if Input.is_action_pressed("move_forward"):
			movement+= acceleration
			velocity = lerp(velocity,Vector2(min(movement, rover_speed),0).rotated(rotation),0.5)
	elif Input.is_action_pressed("move_backward"):
		movement-= acceleration
		velocity = lerp(velocity,Vector2(max(movement, -rover_speed/2),0).rotated(rotation),0.5)
	move_and_slide()
	
	#raycast
	
	var end_point_ray = ray.target_position
	
	if ray.is_colliding():
		end_point_ray = to_local(ray.get_collision_point())
		$RayCast2D/Line2D.set_point_position(1,line_2d_pos-end_point_ray)
	else:
		$RayCast2D/Line2D.set_point_position(1,line_2d_pos)

func _process(delta):
	if rotating_right:
		ray.rotation += 1 * delta
		if ray.rotation >= deg_to_rad(max_angle):
			ray.rotation = deg_to_rad(max_angle)
			rotating_right = false
	else:
		ray.rotation -= 1 * delta
		if ray.rotation <= deg_to_rad(min_angle):
			ray.rotation = deg_to_rad(min_angle)
			rotating_right = true


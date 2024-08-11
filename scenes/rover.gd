extends CharacterBody2D

@export var rover_speed = 350
@export var acceleration = 6
var min_angle = -30
var max_angle = 30
var rotating_right= true
var movement = 0
@onready var ray = $rover_sprite/cam_sprite
var key_pressed = 0
func _physics_process(delta):
	#rover movement
	if velocity==Vector2.ZERO:
		movement = 0
		key_pressed = 0
		velocity = Vector2.ZERO
	velocity = Vector2.ZERO
	var direction_x = Input.get_axis("move_left","move_right")
	if direction_x !=0 && movement !=0:
		rotation += .6 *direction_x *delta
	if Input.is_action_pressed("move_backward") && key_pressed != 1:
		key_pressed = -1
		movement-= acceleration
		velocity = lerp(velocity,Vector2(max(movement, -rover_speed/1.6),0).rotated(rotation),0.5)
	elif Input.is_action_pressed("move_forward") && key_pressed !=-1:
		key_pressed = 1
		movement+= acceleration
		velocity = lerp(velocity,Vector2(min(movement, rover_speed),0).rotated(rotation),0.5)
	move_and_slide()

func _process(delta):
	#raycast rotation
	if rotating_right:
		ray.rotation += .75* delta
		if ray.rotation >= deg_to_rad(max_angle):
			ray.rotation = deg_to_rad(max_angle)
			rotating_right = false
	else:
		ray.rotation -= .75 * delta
		if ray.rotation <= deg_to_rad(min_angle):
			ray.rotation = deg_to_rad(min_angle)
			rotating_right = true


extends CharacterBody2D

@export var rover_speed = 325
@export var acceleration = 6
var min_angle = -30
var max_angle = 30
var rotating_right= true
var movement = 0
@onready var cam = $rover_sprite/cam_sprite
@onready var ray = $RayCast2D
var key_pressed = 0
func _physics_process(delta):
	#rover movement
	if velocity==Vector2.ZERO:
		movement = 0
		key_pressed = 0
		$AudioStreamPlayer2D.stop()
		velocity = Vector2.ZERO
	velocity = Vector2.ZERO
	var direction_x = Input.get_axis("move_left","move_right")
	if direction_x !=0 && movement !=0:
		rotation += .6 *direction_x *delta
	if Input.is_action_pressed("move_backward") && key_pressed != 1:
		key_pressed = -1
		movement-= acceleration
		velocity = Vector2(max(movement, -rover_speed/1.6),0).rotated(rotation)
		$AudioStreamPlayer2D.play()
	elif Input.is_action_pressed("move_forward") && key_pressed !=-1:
		key_pressed = 1
		movement+= acceleration
		velocity = Vector2(min(movement, rover_speed),0).rotated(rotation)
		$AudioStreamPlayer2D.play()
	move_and_slide()
	
	if ray.is_colliding():
		$CollisionShape2D2.disabled = false
	else:
		$CollisionShape2D2.disabled = true
	

func _process(delta):
	#raycast rotation
	if rotating_right:
		cam.rotation += .6* delta
		ray.rotation += .6* delta
		$CollisionShape2D2.rotation += .6* delta
		if cam.rotation >= deg_to_rad(max_angle):
			cam.rotation = deg_to_rad(max_angle)
			ray.rotation = deg_to_rad(300)
			$CollisionShape2D2.rotation = deg_to_rad(max_angle)
			rotating_right = false
	else:
		cam.rotation -= .6 * delta
		ray.rotation -= .6 * delta
		$CollisionShape2D2.rotation -= .6* delta
		if cam.rotation <= deg_to_rad(min_angle):
			cam.rotation = deg_to_rad(min_angle)
			ray.rotation = deg_to_rad(240)
			$CollisionShape2D2.rotation = deg_to_rad(min_angle)
			rotating_right = true


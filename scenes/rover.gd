extends CharacterBody2D

@export var rover_speed = 250
@export var acceleration = 5
var movement = 0
@export var rotation_speed = 1.75

func _physics_process(delta):
	#rover movement
	if velocity==Vector2.ZERO:
		movement = 0
		velocity = Vector2.ZERO
	velocity = Vector2.ZERO
	var direction_x = Input.get_axis("move_left","move_right")
	if direction_x !=0 && movement !=0:
		rotation += .6 *direction_x *delta
	if Input.is_action_pressed("move_backward"):
		movement-= acceleration
		velocity = lerp(velocity,Vector2(max(movement, -rover_speed/2),0).rotated(rotation),0.5)
	elif Input.is_action_pressed("move_forward"):
		movement+= acceleration
		velocity = lerp(velocity,Vector2(min(movement, rover_speed),0).rotated(rotation),0.5)
	move_and_slide()

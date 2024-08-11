extends Area2D

var array =[]
signal object_collected(obj_type)
var colliding
enum object_types{ROCK,SCRAP,FOSSIL,CRYSTAL,BIOLOGICAL_SAMPLES}

@export var selected_object_type:object_types

func _process(delta):
	if !colliding and !array.is_empty():
		collision()
	await get_tree().create_timer(1.5).timeout
	
func _on_body_entered(body):
	if body.is_in_group("rover"):
		array.append(body)

func collision():
	if !array.is_empty() && Input.is_action_just_pressed('pick'):
		match selected_object_type:
			object_types.ROCK:
				print('rock')
			object_types.SCRAP:
				print("scrap")
			object_types.FOSSIL:
				print("fossil")
			object_types.CRYSTAL:
				print("crystal")
			object_types.BIOLOGICAL_SAMPLES:
				print("samples")
		colliding = true
		await get_tree().create_timer(2.5).timeout
		colliding = false


func _on_body_exited(body):
	if body.is_in_group("rover"):
		array.erase(body)
	

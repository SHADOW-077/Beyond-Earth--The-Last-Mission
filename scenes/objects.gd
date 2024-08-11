extends Area2D

var array =[]
signal object_collected(obj_type)
var colliding
enum object_type{ROCK,SCRAP,FOSSIL}
@export var object_types:object_type
func _process(delta):
	if !colliding and !array.is_empty():
		collision()
	await get_tree().create_timer(1.5).timeout
	
func _on_body_entered(body):
	if body.is_in_group("rover"):
		array.append(body)

func collision():
	if !array.is_empty() && Input.is_action_just_pressed('pick'):
		
		colliding = true
		await get_tree().create_timer(.5).timeout
		colliding = false
	


func _on_body_exited(body):
	if body.is_in_group("rover"):
		array.erase(body)

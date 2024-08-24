extends Node2D

@onready var dialog_box = $"CanvasLayer/dialog box"
var last_collected_sample 
var no_samples = 0
func _ready():
	pass
	

func _process(delta):
	if no_samples >= 5:
		$"StaticBody2D/CollisionShape2D".disabled = true
		dialog_box.empty_text()


func _on_rock_object_collected(obj_type):
	no_samples += 1
	dialog_box.set_instruction(no_samples)
	


func _on_crystal_object_collected(obj_type):
	no_samples += 1
	dialog_box.set_instruction(no_samples)


func _on_shrrom_object_collected(obj_type):
	no_samples += 1
	dialog_box.set_instruction(no_samples)


func _on_misc_object_collected(obj_type):
	no_samples += 1
	dialog_box.set_instruction(no_samples)


func _on_crystal_2_object_collected(obj_type):
	no_samples += 1
	dialog_box.set_instruction(no_samples)


func _on_upload_station_body_entered(body):
	$CanvasLayer/win.show()

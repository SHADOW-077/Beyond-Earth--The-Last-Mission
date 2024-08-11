extends Node2D

@onready var dialog_box = $"CanvasLayer/dialog box"
var last_collected_sample 
var no_samples = 0
func _ready():
	pass
	

func _process(delta):
	pass
	


func _on_rock_object_collected(obj_type):
	no_samples += 1
	dialog_box.set_instruction(no_samples)
	

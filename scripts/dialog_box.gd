extends Control

func set_instruction(new_txt):
	$QUEST.text = "QUESTS:\n" + "COLLECT 5 SAMPLES\n" + "STATUS:\n" +str(new_txt) +" SAMPLES COLLECTED"
	 

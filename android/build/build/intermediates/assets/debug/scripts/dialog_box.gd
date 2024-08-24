extends Control

func set_instruction(new_txt):
	$QUEST.text = "QUESTS:\n" + "COLLECT 5 SAMPLES\n" + "STATUS:\n" +str(new_txt) +" SAMPLES COLLECTED"
	 
func empty_text():
	$QUEST.text = ""
	$QUEST.text = "QUESTS:\n" + "UPLOAD THE DATA\n" + "TO SERVER" 

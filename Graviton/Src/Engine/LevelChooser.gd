extends Control

func _on_Level1_pressed():
	Main.chooseLevel(1)
	self.queue_free()

func _on_Level2_pressed():
	Main.chooseLevel(2)
	self.queue_free()

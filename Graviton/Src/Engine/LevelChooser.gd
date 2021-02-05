extends CanvasLayer

func _ready():
	Main.setFase(self)

func _on_Level1_pressed():
	Main.cleanup(1)

func _on_Level2_pressed():
	Main.cleanup(2)


func _on_Timer_timeout():
		self.queue_free()

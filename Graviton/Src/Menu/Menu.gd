extends Node2D



func _on_Play_pressed():
	Main.setFase(self)
	Main.cleanup(0)


func _on_Quit_pressed():
	pass # Replace with function body.

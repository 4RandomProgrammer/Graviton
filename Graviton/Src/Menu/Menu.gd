extends Node2D



func _on_Play_pressed():
	Main.setFase(self)
	select()
	Main.cleanup(0)


func _on_Quit_pressed():
	select()
	pass # Replace with function body.


func _on_Play_mouse_entered():
	hover()


func _on_Quit_mouse_entered():
	hover()


func hover():
	$MenuHover.play()

func select():
	$Selected.play()

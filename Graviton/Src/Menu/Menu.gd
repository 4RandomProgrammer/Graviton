extends Node2D

func _on_Play_pressed():
	Main.setFase(self)
	select()
	Main.cleanup(0)


func _on_Quit_pressed():
	select()
	

func _on_Creditos_pressed():
	$Creditos2.visible = true
	select()

func _on_Voltar_pressed():
	$Creditos2.visible = false
	select()

func _on_Play_mouse_entered():
	hover()

func _on_Quit_mouse_entered():
	hover()

func _on_Voltar_mouse_entered():
	hover()


func _on_Creditos_mouse_entered():
	hover()

func hover():
	$MenuHover.play()

func select():
	$Selected.play()




extends Node2D


func _ready():
	Main.start_music(0)
	$Play.grab_focus()

func _on_Play_pressed():
	Main.setFase(self)
	select()
	Main.cleanup(0)


func _on_Quit_pressed():
	select()


func _on_Creditos_pressed():
	$Creditos2.visible = true
	$Creditos2/Voltar.grab_focus()
	select()

func _on_Voltar_pressed():
	$Creditos2.visible = false
	$opcoes.visible = false
	$Button.grab_focus()
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

func _on_Button_pressed():
	$opcoes.visible = true
	$opcoes/Voltar.grab_focus()
	select()

func _on_Button_mouse_entered():
	$MenuHover.play()


func _on_Play_focus_entered():
	hover()


func _on_Button_focus_entered():
	hover()


func _on_Creditos_focus_entered():
	hover()


func _on_Quit_focus_entered():
	hover()


func _on_Voltar_focus_entered():
	$MenuHover.play()

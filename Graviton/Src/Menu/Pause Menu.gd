extends Control


func _input(event):
	if event.is_action_pressed("Pause"):
		pause()

func _on_Play_pressed():
	pause()
	$Pause/Play.release_focus()
	$Click.play()

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = not get_tree().paused
	$Pause.visible = new_pause_state
	$PauseBtn.visible = !new_pause_state
	if(new_pause_state):
		$Pause/Play.grab_focus()

func _on_PauseBtn_pressed():
	pause()
	$Click.play()

func _on_PauseBtn_mouse_entered():
	$Entered.play()


func _on_Menu_pressed():
	pause()
	Main.seg = 0
	Main.m = 0
	Main.cleanup(0)
	$Click.play()


func _on_Play_mouse_entered():
	$Entered.play()


func _on_Menu_mouse_entered():
	$Entered.play()


func _on_TextureButton_pressed():
	$Options.visible = false
	$Pause/Button.grab_focus()
	$Click.play()


func _on_TextureButton_mouse_entered():
	$Entered.play()


func _on_Button_pressed():
	$Options.visible = true
	$Options/TextureButton.grab_focus()
	$Click.play()


func _on_Button_mouse_entered():
	$Entered.play()


func _on_Play_focus_entered():
	$Entered.play()


func _on_Button_focus_entered():
	$Entered.play()

func _on_Menu_focus_entered():
	$Entered.play()

func _on_TextureButton_focus_entered():
	$Entered.play()

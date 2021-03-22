extends Control


func _input(event):
	if event.is_action_pressed("Pause"):
		pause()

func _on_Play_pressed():
	pause()
	$Click.play()

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = not get_tree().paused
	$Pause.visible = new_pause_state
	$PauseBtn.visible = !new_pause_state

func _on_PauseBtn_pressed():
	pause()
	$Click.play()

func _on_PauseBtn_mouse_entered():
	$Entered.play()


func _on_Menu_pressed():
	pause()
	Main.cleanup(0)
	$Click.play()


func _on_Play_mouse_entered():
	$Entered.play()


func _on_Menu_mouse_entered():
	pass # Replace with function body.

extends Control


func _input(event):
	if event.is_action_pressed("Pause"):
		pause()

func _on_TextureButton_pressed():
	pause()

func pause():
	var new_pause_state = not get_tree().paused
	get_tree().paused = not get_tree().paused
	$Pause.visible = new_pause_state
	$PauseBtn.visible = !new_pause_state

func _on_PauseBtn_pressed():
	pause()

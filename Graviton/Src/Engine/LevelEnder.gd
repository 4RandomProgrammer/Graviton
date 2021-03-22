extends Area2D

func _on_LevelEnder_body_entered(_body):
	$AudioStreamPlayer.play()
	Main.set_musicTime(0.0)
	Main.cleanup(0)

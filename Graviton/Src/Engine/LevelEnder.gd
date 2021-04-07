extends Area2D

func _on_LevelEnder_body_entered(_body):
	$AudioStreamPlayer.play()
	Main.cleanup(0)

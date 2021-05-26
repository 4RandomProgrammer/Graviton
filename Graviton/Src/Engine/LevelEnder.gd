extends Area2D

signal levelEnded

func _on_LevelEnder_body_entered(body):
	$AudioStreamPlayer.play()
	emit_signal("levelEnded")
	body.playanim()
	Main.cleanup(0)

extends Area2D



func _on_reverse_body_entered(body):
	if body.has_method("reverse"):
		body.setInvert(0)
		body.reverse(false)
		$AudioStreamPlayer.play()

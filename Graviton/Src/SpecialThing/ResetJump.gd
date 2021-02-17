extends Area2D

func _on_ResetJump_body_entered(body):
	if body.has_method("_on_CollisionDetector_body_entered"):
		body._on_CollisionDetector_body_entered(body)
		$Sprite.visible = false
		$CollisionShape2D.set_deferred("disabled",true)
		$AudioStreamPlayer.play()
		$Timer.start(-1)



func _on_Timer_timeout():
	$Sprite.visible = true
	$CollisionShape2D.set_deferred("disabled",false)

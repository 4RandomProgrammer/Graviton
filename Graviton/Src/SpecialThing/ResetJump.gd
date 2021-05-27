extends Area2D

func _on_ResetJump_body_entered(body):
	if body.has_method("_on_CollisionDetector_body_entered"):
		body._on_CollisionDetector_body_entered(self)
		$Sprite.frame = 1
		$CollisionShape2D.set_deferred("disabled",true)
		$AudioStreamPlayer.play()
		$Particles2D.visible = false
		$Timer.start(-1)



func _on_Timer_timeout():
	$Particles2D.visible = true
	$Sprite.frame = 0
	$CollisionShape2D.set_deferred("disabled",false)

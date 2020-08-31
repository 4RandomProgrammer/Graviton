extends Area2D

func _on_ResetJump_body_entered(body):
	if body.has_method("set_invert_counter"):
		body.set_invert_counter(0)
		$Sprite.visible = false
		$CollisionShape2D.set_deferred("disabled",true)
		$Timer.start(-1)



func _on_Timer_timeout():
	$Sprite.visible = true
	$CollisionShape2D.set_deferred("disabled",false)

extends StaticBody2D

export var x_value = 0
export var y_value = -550

func _on_JumpArea_body_entered(body):
	if body.has_method("set_gravity"):
		body.set_gravity(x_value,y_value)
		$AnimationPlayer.play("poing")
		$AudioStreamPlayer2D.play()
		body._on_CollisionDetector_body_entered(self)

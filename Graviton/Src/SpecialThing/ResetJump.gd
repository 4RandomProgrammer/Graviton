extends Area2D

func _on_ResetJump_body_entered(body):
	if body.has_method("set_invert_counter"):
		body.set_invert_counter(0)
		queue_free()

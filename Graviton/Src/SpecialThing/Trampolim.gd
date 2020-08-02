extends Area2D



func _on_Trampolim_body_entered(body):
	if body.has_method("add_gravity"):
		body.add_gravity(-750)


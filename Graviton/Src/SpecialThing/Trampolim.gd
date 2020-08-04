extends Area2D

export var x_value = 0
export var y_value = -750

func _on_Trampolim_body_entered(body):
	if body.has_method("add_gravity"):
		body.add_gravity(x_value,y_value)


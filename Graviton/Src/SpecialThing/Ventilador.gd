extends Area2D

var player = null
export var yValue = -29

func _ready():
	set_physics_process(false)

func _physics_process(_delta):
	player.add_gravity(0, yValue)

func _on_Ventilador_body_entered(body):
	if body.has_method("add_gravity"):
		player = body
		set_physics_process(true)

func _on_Ventilador_body_exited(_body):
	if player != null:
		set_physics_process(false)
		player = null

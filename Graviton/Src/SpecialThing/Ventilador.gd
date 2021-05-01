extends Area2D

var player = null
export var yValue = -35
export var xValue = 0

func _ready():
	set_physics_process(false)
	$AudioStreamPlayer2D.play()

func _physics_process(_delta):
	player.add_gravity(xValue, yValue)
	player.snap = false

func _on_Ventilador_body_entered(body):
	if body.has_method("add_gravity"):
		player = body
		set_physics_process(true)

func _on_Ventilador_body_exited(_body):
	if player != null:
		set_physics_process(false)
		player = null

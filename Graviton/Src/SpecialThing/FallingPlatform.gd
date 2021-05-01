extends KinematicBody2D

onready var animation_player = $AnimationPlayer
onready var timer = $Timer
onready var reset_position = global_position
export (float)var reset_time = 1.0
var velocity = Vector2()
var is_triggered = false

export (int) var GRAVITY = 500

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	position += velocity * delta
	

func _on_Timer_timeout():
	set_physics_process(false)
	$CollisionShape2D.set_deferred("disabled", true)
	global_position = reset_position
	is_triggered = false
	$CollisionShape2D.set_deferred("disabled", false)

func _on_AnimationPlayer_animation_finished(_anim_name):
	set_physics_process(true)
	timer.start(reset_time)

func _on_Area2D_body_entered(_body):
	if !is_triggered:
		is_triggered = true
		animation_player.play("Shake")
		velocity = Vector2.ZERO

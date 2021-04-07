extends Node2D

export (int) var GRAVITY = 500

onready var animation_player = $AnimationPlayer
onready var timer = $Timer
onready var reset_position = $Spike.global_position
export (float)var reset_time = 1.0
var velocity = Vector2()
var is_triggered = false
var oldGravity = 500


func _ready():
	set_physics_process(false)

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity =  $Spike.move_and_slide(velocity,Vector2.UP);

func _on_FallArea_body_entered(_body):
	if !is_triggered:
		is_triggered = true
		animation_player.play("Shake")
		velocity = Vector2.ZERO
		$FallArea/CollisionShape2D.set_deferred("disabled",true)


func _on_AnimationPlayer_animation_finished(_anim_name):
	set_physics_process(true)
	timer.start(reset_time)


func _on_Timer_timeout():
	set_physics_process(false)
	yield(get_tree(),"physics_frame")
	var temp = $Spike.collision_layer
	$Spike.collision_layer = 0
	$Spike.global_position = reset_position
	yield(get_tree(),"physics_frame")
	$Spike.collision_layer = temp
	is_triggered = false
	$FallArea/CollisionShape2D.set_deferred("disabled",false)
	GRAVITY = oldGravity


func _on_DeathZone_body_entered(_body):
	set_physics_process(false)


func _on_StopArea_body_entered(_body):
	print("aaaaaaaaaaaaaaaa")
	oldGravity = GRAVITY
	GRAVITY = 0

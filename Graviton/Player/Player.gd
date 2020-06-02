extends KinematicBody2D

const GRAVITY = 0
const SPEED = 100

var movement = Vector2.ZERO
var gravityOrder = 1

func _physics_process(delta):
	movement.y += gravityOrder * GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		movement.x  += SPEED
	elif Input.is_action_pressed("ui_left"):
		movement.x += SPEED
		
	move_and_slide(movement)

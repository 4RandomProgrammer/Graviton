extends KinematicBody2D

const GRAVITY = 135
const SPEED = 100

var movement = Vector2.ZERO
var gravityOrder = 1
var on_floor = false
var UP = Vector2.UP
var DOWN = Vector2(0,1)
onready var Esprite = $Sprite

func _physics_process(delta):
	movement.y += gravityOrder * GRAVITY
	if gravityOrder == 1:
		movement.y = min(movement.y,GRAVITY)
	else:
		movement.y = max(movement.y,-GRAVITY)
	
	
	if Input.is_action_pressed("ui_right"):
		Esprite.flip_h = false
		Esprite.play("Walking")
		movement.x  += SPEED
		movement.x = min(SPEED,movement.x)
	elif Input.is_action_pressed("ui_left"):
		Esprite.flip_h = true
		Esprite.play("Walking")
		movement.x -= SPEED
		movement.x = max(movement.x,-SPEED)
		
	else:
		Esprite.play("Idle")
		movement.x = 0
		
	if Input.is_action_just_pressed("ui_focus_next"):
		gravityOrder *= -1
		if gravityOrder == 1:
			Esprite.flip_v = false
		else:
			Esprite.flip_v = true
	

	movement = move_and_slide(movement,UP)

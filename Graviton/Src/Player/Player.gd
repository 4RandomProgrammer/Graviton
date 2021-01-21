extends KinematicBody2D

signal groundedUptaded(isGrounded)

const GRAVITY = 40
const MAXGRAVITY = 240
const SPEED = 100

var movement = Vector2.ZERO
var gravityOrder = 1
var on_floor = false
var UP = Vector2.UP
var InvertCounter = 0
var isGrounded  = null

export (int)var MaxHealth = 3

onready var Health = MaxHealth
onready var Esprite = $Sprite

func _physics_process(_delta):

	movement.y += gravityOrder * GRAVITY
	
	if gravityOrder == 1:
		movement.y = min(movement.y,MAXGRAVITY)
	else:
		movement.y = max(movement.y,-MAXGRAVITY)
	
	if Input.is_action_pressed("ui_right"):
		Esprite.flip_h = false
		movement.x  += SPEED
		movement.x = min(SPEED,movement.x)
	elif Input.is_action_pressed("ui_left"):
		Esprite.flip_h = true
		movement.x -= SPEED
		movement.x = max(movement.x,-SPEED)
	else:
		movement.x = 0
		
	if Input.is_action_just_pressed("ui_up"):
		if InvertCounter < 1:
			InvertCounter += 1
			reverse()
		
	movement = move_and_slide(movement,UP)
	
#	var wasGrounded = isGrounded
#	isGrounded = is_on_floor()
#
#	if wasGrounded == null || isGrounded != is_on_floor():
#		emit_signal("groundedUptaded", isGrounded)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision,self)

func reverse():
	
	gravityOrder *= -1
	
	if gravityOrder == 1:
		Esprite.flip_v = false
	else:
		Esprite.flip_v = true

func set_invert_counter(value):
	InvertCounter = value

func _on_CollisionDetector_body_entered(_body):
	InvertCounter = 0

func add_gravity(xvalue,yvalue):
	movement.y = yvalue
	movement.x = xvalue

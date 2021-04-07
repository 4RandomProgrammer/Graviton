extends KinematicBody2D

enum {
	ALIVE,
	DEAD
}

const MAXGRAVITY = 240
const SPEED = 125
const MAX_JUMP_HEIGHT = 36
const MIN_JUMP_HEIGHT = 20
const jump_duration = 0.21

var movement = Vector2.ZERO
var gravityOrder = 1
var on_floor = false
var UP = Vector2.UP
var InvertCounter = 0
var isGrounded  = null
var jumpCounter = 0
var state = ALIVE
var max_jump_velocity
var min_jump_velocity
var gravity

export (int)var MaxHealth = 3

onready var Health = MaxHealth
onready var Esprite = $Sprite

func _ready():
	Main.startLevel() #animação de fade in
	gravity = 2 * MAX_JUMP_HEIGHT / pow(jump_duration, 2)
	max_jump_velocity = sqrt(2 * gravity * MAX_JUMP_HEIGHT)
	min_jump_velocity = sqrt(2 * gravity * MIN_JUMP_HEIGHT)

func _physics_process(delta):
	
	match state:
		ALIVE:
			
			jumpControl()
			controls()
			
			$Label.set_text(str(movement))
			
			if gravityOrder == 1:
				movement.y = approach(movement.y,MAXGRAVITY,  gravity * delta)
			else:
				movement.y = approach(movement.y,-MAXGRAVITY, gravity * delta)
			
			movement = move_and_slide(movement,UP)
		DEAD:
			$Sprite.frame = 2
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision,self)

func jumpControl():
		#Pulo/movimento vertical
	if Input.is_action_just_pressed("ui_up"):
		if jumpCounter < 1:
			$Jump.play()
			movement.y = max_jump_velocity * - (gravityOrder)
			jumpCounter += 1
			
	if Input.is_action_just_released("ui_up") and movement.y < min_jump_velocity and jumpCounter :
		movement.y = min_jump_velocity * gravityOrder

func controls():
	#Movimento horizontal
	if Input.is_action_pressed("ui_right"):
		Esprite.flip_h = false
		movement.x =  approach(movement.x, SPEED, SPEED)
	
	elif Input.is_action_pressed("ui_left"):
		Esprite.flip_h = true
		movement.x = approach(movement.x, -SPEED, SPEED)
	
	else:
		movement.x = approach(movement.x, 0, SPEED)
	
	if Input.is_action_just_pressed("ui_accept"):
		if InvertCounter < 1:
			InvertCounter += 1
			Esprite.frame = 1
			reverse()

func reverse():
	
	$ChangeGravity.play()
	
	gravityOrder *= -1
	
	if gravityOrder == 1:
		Esprite.flip_v = false
	else:
		Esprite.flip_v = true

func DeathSound():
	state = DEAD
	if !$DeathSound.is_playing():
		Main.set_vol(-8)
		$DeathSound.play()

func _on_CollisionDetector_body_entered(body):
	if body is TileMap:
		_check_tilemap(body)
	
	InvertCounter = 0
	$Sprite.frame = 0
	
	#não soube uma forma melhor que isso
	if(body != self):
		jumpCounter = 0

func _check_tilemap(body : TileMap):
	if body.has_method("_on_DeathZone_body_entered"):
		body._on_DeathZone_body_entered(self)


func add_gravity(xvalue,yvalue):
	movement.y += yvalue
	movement.x += xvalue


func set_gravity(xvalue,yvalue):
	movement.y = yvalue
	movement.x = xvalue

func approach(current, target, amount):
	if (current < target):
		current += amount
		
		if current > target:
			return target
			
	else:
		current -= amount
		
		if(current < target):
			return target
	return current

func _on_DeathSound_finished():
	Main.set_vol(0)

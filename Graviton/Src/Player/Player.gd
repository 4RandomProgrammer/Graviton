extends KinematicBody2D

signal died

enum {
	ALIVE,
	DEAD,
	ONFLOOR,
	NOTONFLOOR
}

const MAXGRAVITY = 240
const SPEED = 125
const MAX_JUMP_HEIGHT = 36
const MIN_JUMP_HEIGHT = 20
const jump_duration = 0.20

var onRotating  = false
var snap = false
var movement = Vector2.ZERO
var gravityOrder = 1
var on_floor = false
var UP = Vector2.UP
var InvertCounter = 0
var jumpCounter = 0
var state = ALIVE
var max_jump_velocity
var min_jump_velocity
var gravity
var positionUp = Vector2(0,-5)
var positionDown = Vector2(0,3)
var snapVec = Vector2(0,2)


export (int)var MaxHealth = 3
export (bool)var speedRunning = false

onready var Health = MaxHealth
onready var Esprite = $Sprite

func _ready():
	Main.startLevel() #animação de fade in
	gravity = 2 * MAX_JUMP_HEIGHT / pow(jump_duration, 2)
	max_jump_velocity = sqrt(2 * gravity * MAX_JUMP_HEIGHT)
	min_jump_velocity = sqrt(2 * gravity * MIN_JUMP_HEIGHT)
	
	if Main.speed:
		$Camera2D/CanvasLayer/Timer.visible = true
	
#BUG QUANDO ELE PULA EM UMA RAMPA, POR ALGUM MOTIVO ELE VAI PRO MÁX DA GRAVIDADE
#E NÃO O MAX DO PULO, O PQ? EU NÃO SEI, SEI QUE ACONTECE.
func _physics_process(delta):
	
	match state:
		ALIVE:
			
			jumpControl()
			controls()
			gravityControl(delta)
			
			if snap:
				snapVec = Vector2(0,2 * gravityOrder)
			else:
				snapVec = Vector2.ZERO
			
			
		DEAD:
			gravityControl(delta)
			movement.x = 0
		
	movement = move_and_slide_with_snap(movement,snapVec, UP)
	$Label.set_text(str(movement))
	$Label2.set_text(str(jumpCounter))


func gravityControl(delta):
	
	if gravityOrder == 1:
		movement.y = approach(movement.y,MAXGRAVITY,  gravity * delta)
	else:
		movement.y = approach(movement.y,-MAXGRAVITY, gravity * delta)


func jumpControl():
	#Pulo/movimento vertical
	if Input.is_action_pressed("UP") and jumpCounter < 1:
		snap = false
		$Jump.play()
		movement.y = max_jump_velocity * - (gravityOrder)
		jumpCounter += 1
		$CollisionDetector/CollisionShape2D.set_deferred("disabled", true)
		$JumpTimer.start()
		
	if Input.is_action_just_released("UP") and movement.y < min_jump_velocity and jumpCounter:
		movement.y = min_jump_velocity * gravityOrder
	

func controls():
	#Movimento horizontal
	
	if Input.is_action_pressed("RIGHT"):
		Esprite.flip_h = false
		movement.x = approach(movement.x, SPEED, SPEED)
		

	elif Input.is_action_pressed("LEFT"):
		Esprite.flip_h = true
		movement.x = approach(movement.x, -SPEED, SPEED)

	else:
		movement.x = approach(movement.x, 0, SPEED)
	
#	var move_direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
#	movement.x = lerp(movement.x, SPEED * move_direction, 0.2)
	if Input.is_action_just_pressed("InvertGravity"):
		if InvertCounter < 1:
			InvertCounter += 1
			Esprite.frame = 1
			reverse(true)

func reverse(play):
	if play:
		$ChangeGravity.play()
	snap = false
	gravityOrder *= -1
	$CollisionDetector.position = $CollisionDetector.position * -1
	
	if gravityOrder == 1:
		UP = Vector2.UP
		Esprite.flip_v = false
		$CollisionShape2D2.position = positionUp
	else:
		UP = Vector2.DOWN
		Esprite.flip_v = true
		$CollisionShape2D2.position = positionDown

func DeathSound():
	state = DEAD
	$CollisionShape2D.set_deferred("disabled", true)
	$CollisionDetector/CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D2.set_deferred("disabled", false)
	
	if !$DeathSound.is_playing():
		$AnimationPlayer.play("Death")
		Main.set_vol(-8)
		$DeathSound.play()

func playanim():
	if Main.speed:
		$Camera2D/CanvasLayer/Timer/AnimationPlayer.play("Flash")

func _on_CollisionDetector_body_entered(body):
	
	if body is TileMap:
		_check_tilemap(body)
	
	#não soube uma forma melhor que isso
	if(body != self):
		jumpCounter = 0
		InvertCounter = 0
		$Sprite.frame = 0
		snap = true

func _check_tilemap(body : TileMap):
	if body.has_method("_on_DeathZone_body_entered"):
		body._on_DeathZone_body_entered(self)


func add_gravity(xvalue,yvalue):
	movement.x += xvalue
	movement.y += yvalue


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

func setFrame(frame):
	$Sprite.frame = frame

func setInvert(invert):
	InvertCounter = invert

func _on_DeathSound_finished():
	Main.set_vol(0)


func _on_DeathArea_body_entered(_body):
	DeathSound()
	emit_signal("died")

func _on_CollisionDetector_body_exited(_body):
	snap = false


func _on_JumpTimer_timeout():
	$CollisionDetector/CollisionShape2D.set_deferred("disabled", false)

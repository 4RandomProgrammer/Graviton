extends KinematicBody2D

const UP = Vector2.UP

export (int) var speed_y = 200
export (int) var speed_x = 0
export (float) var reset_time = 0.5

var velocity = Vector2.ZERO

func _ready():
	$Timer.start(reset_time)

func _physics_process(_delta):
	$Label.set_text(str(velocity))
	
	velocity.x = speed_x
	velocity.y = speed_y
	
	velocity = move_and_slide(velocity, UP)


func _on_Timer_timeout():
	$Sprite.flip_v = !$Sprite.flip_v
	speed_x *= -1
	speed_y *= -1
	$Timer.start(reset_time)


func _on_ResetPosition_body_entered(_body):
	$Sprite.flip_v = !$Sprite.flip_v
	speed_x *= -1
	speed_y *= -1
	$Timer.start(reset_time)

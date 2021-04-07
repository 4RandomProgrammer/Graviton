extends Node2D



var follow = Vector2.ZERO

export var moveTo = Vector2.RIGHT * 192 #192 é a distancia que a plataforma percorre na direção do vetor de duas direções
export var speed = 3.0
export var isMoving = false
export(float) var IDLE_DURATION  = 1.0

onready var platform = $Platform
onready var moveTween = $MoveTween

func _ready():
	if isMoving:
		initTween()
		set_physics_process(true)
	else:
		set_physics_process(false)

func  _physics_process(_delta):
	platform.position = platform.position.linear_interpolate(follow, 0.075)
	
#função para iniciar o tween, ela vai controlar o tempo em que ele fica indo de um lado para o outro
func initTween():
	var duration = moveTo.length() / float (speed * 16) # 16 é o tamanho de cada tile do jogo
	moveTween.interpolate_property(self, "follow", Vector2.ZERO, moveTo, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	moveTween.interpolate_property(self, "follow", moveTo, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION + duration * 2)
	moveTween.start()


tool
extends Node2D

var platforms = []
var orbitAngleOffset = 0
var previousChildCount
 
export(int) var dir = 1
export var radius = Vector2.ONE * 256
export var rotationDuration := 10


func _physics_process(delta):
	
	if previousChildCount !=  get_child_count():
		previousChildCount = get_child_count()
		findPlatforms()
	
	orbitAngleOffset += dir * 2 * PI  * delta / float(rotationDuration) #calculando a velocidade angular da plataforma
	orbitAngleOffset = wrapf(orbitAngleOffset, -PI, PI) #Para não deixar o valor estourar
	updatePlatforms()

#função para espalhar as plataformas no ponto
func updatePlatforms():
	if platforms.size() != 0:
		var spacing = 2 * PI / float(platforms.size())
		for i in platforms.size():
			var new_position = Vector2.ZERO
			#fazendo o circulo com vetor unitário
			new_position.x = cos(spacing * i + orbitAngleOffset) * radius.x
			new_position.y = sin(spacing * i + orbitAngleOffset) * radius.y
			platforms[i].position = new_position

#para colocar várias as plataformas do grupo: plata formas orbitando esse ponto
func findPlatforms():
	platforms = []
	for child in get_children():
		if child.is_in_group("platforms"):
			platforms.append(child)

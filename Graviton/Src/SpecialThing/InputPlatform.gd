extends KinematicBody2D


var player
var playerInvert = null
export (int)var invertCounter = 0
var sprite


func _ready():
	player = get_parent().get_parent().get_node("Player") #Não tem um jeito melhor de fazer????
	match invertCounter:
		0:
			$Sprite2.visible = false
			sprite = $Sprite1
		1:
			$Sprite1.visible = false
			sprite = $Sprite2
			$CollisionShape2D.disabled = true


func _input(event):
	
	playerInvert = player.InvertCounter
	#atualizar o valor do invert counter
	
	if event.is_action_pressed("ui_accept") and playerInvert == 0:
		
		$CollisionShape2D.disabled = !$CollisionShape2D.disabled
		
		if sprite.frame == 0:
			sprite.frame = 1
		else:
			sprite.frame = 0

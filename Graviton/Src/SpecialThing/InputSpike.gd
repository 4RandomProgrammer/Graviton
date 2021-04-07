extends StaticBody2D

var player
var playerInvert = null
export (int)var invertCounter = 0
var sprite


func _ready():
	player = get_parent().get_parent().get_node("Player") #Não tem um jeito melhor de fazer????
	sprite = $Sprite
	sprite.frame = invertCounter
	match invertCounter:
		1:
			$CollisionShape2D.disabled = true
			$DeathZone/CollisionShape2D.disabled = true


func _input(event):
	
	playerInvert = player.InvertCounter
	#atualizar o valor do invert counter
	
	if event.is_action_pressed("ui_accept") and playerInvert == 0:
		
		$CollisionShape2D.disabled = !$CollisionShape2D.disabled
		$DeathZone/CollisionShape2D.disabled = !$DeathZone/CollisionShape2D.disabled
		
		if sprite.frame == 0:
			sprite.frame = 1
		else:
			sprite.frame = 0


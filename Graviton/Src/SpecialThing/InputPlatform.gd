extends KinematicBody2D


var player
var invertCounter

func _ready():
	player = get_parent().get_node("Player") #Não tem um jeito melhor de fazer????

func _input(event):
	
	invertCounter = player.InvertCounter
	#atualizar o valor do invert counter
	
	if event.is_action_pressed("ui_accept") and invertCounter == 0:
		
		$CollisionShape2D.disabled = !$CollisionShape2D.disabled
		
		if $ColorRect.frame == 0:
			$ColorRect.frame = 1
		else:
			$ColorRect.frame = 0

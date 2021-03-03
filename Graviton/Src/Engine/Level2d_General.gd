extends Node2D

func _ready():
	var value = Main.get_CheckPoint()
	
	if value != Vector2.ZERO:
		$Player.position = value 

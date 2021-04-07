extends Node2D

func _ready():
	Main.set_vol(0)
	var value = Main.get_CheckPoint()
	
	if value != Vector2.ZERO:
		$Player.position = value 



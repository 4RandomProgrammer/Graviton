extends Node2D

export (int) var area = 0

func _ready():
	Main.set_vol(0)
	var value = Main.get_CheckPoint()
	
	if value != Vector2.ZERO:
		$Player.position = value 

func _on_Player_died():
	Main.cleanup(area)

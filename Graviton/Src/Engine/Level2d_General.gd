extends Node2D

func _ready():
	$Music.play(Main.get_musicTime())
	var value = Main.get_CheckPoint()
	
	if value != Vector2.ZERO:
		$Player.position = value 


func _on_SpikeTileMap_call_time():
	$Music.stop()
	Main.set_musicTime($Music.get_playback_position())

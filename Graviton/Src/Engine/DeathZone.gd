extends Area2D

export var area = 1

func _on_DeathZone_body_entered(body):
	Main.cleanup(area)
	body.DeathSound()

extends Node2D

export var area = 1

func _on_DeathZone_body_entered(body):
	if body.has_method("DeathSound"):
		Main.cleanup(area, false)
		body.DeathSound()

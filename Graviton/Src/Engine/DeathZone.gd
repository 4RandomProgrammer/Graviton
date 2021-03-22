extends Node2D

export var area = 1
signal call_time

func _on_DeathZone_body_entered(body):
	emit_signal("call_time")
	Main.cleanup(area)
	body.DeathSound()

extends Area2D


func _on_DeathZone_body_entered(_body):
	get_tree().change_scene("res://Areas/World.tscn")

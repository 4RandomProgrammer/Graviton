extends Area2D

export var area = "res://Src/Areas/The-Basics.tscn"

func _on_DeathZone_body_entered(_body):
	get_tree().change_scene(area)
	print("entrou")

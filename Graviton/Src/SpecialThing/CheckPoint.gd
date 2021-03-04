extends Area2D


func _on_CheckPoint_body_entered(body):
	Main.set_CheckPoint(body.position)
	$Sprite.frame = 1

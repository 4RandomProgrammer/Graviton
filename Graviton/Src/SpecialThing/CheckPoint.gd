extends Area2D

signal update

func _ready():
	assert(connect("update", get_parent().get_parent(), "update") == OK)

func _on_CheckPoint_body_entered(body):
	emit_signal("update")
	Main.set_CheckPoint(body.position)
	$Sprite.frame = 1
	$Sound.play()

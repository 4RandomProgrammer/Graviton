extends Area2D


export (int) var number = 0;

signal coletado(number)


func _on_Coletavel_body_entered(_body):
	emit_signal("coletado", number)
	self.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	$SFX.play()


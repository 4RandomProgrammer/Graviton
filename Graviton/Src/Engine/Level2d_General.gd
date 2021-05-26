extends Node2D

export (int) var area = 0
var colected = ["N", "N", "N"]

func _ready():
	colected = Main.getColetaveis()
	print(colected)
	colectedControl()
	Main.set_vol(0)
	var value = Main.get_CheckPoint()
	
	
	if value != Vector2.ZERO:
		$Player.position = value 

func _on_Player_died():
	Main.cleanup(area)

func colectedControl():

	if(colected[0] == "S"):
		$Coletaveis/Coletavel0.visible = false
		$Coletaveis/Coletavel0/CollisionShape2D.set_deferred("disabled", true)
	else:
		$Coletaveis/Coletavel0.visible = true
		$Coletaveis/Coletavel0/CollisionShape2D.set_deferred("disabled", false)
	
	if(colected[0] == "S"):
		$Coletaveis/Coletavel1.queue_free()
		$Coletaveis/Coletavel1/CollisionShape2D.set_deferred("disabled", true)
	else:
		$Coletaveis/Coletavel1.visible = true
		$Coletaveis/Coletavel1/CollisionShape2D.set_deferred("disabled", false)
	
	if(colected[0] == "S"):
		$Coletaveis/Coletavel1.queue_free()
		$Coletaveis/Coletavel1/CollisionShape2D.set_deferred("disabled", true)
	else:
		$Coletaveis/Coletavel1.visible = true
		$Coletaveis/Coletavel1/CollisionShape2D.set_deferred("disabled", false)

func _on_Coletavel0_coletado(number):
	colected[number] = "S"

func _on_Coletavel1_coletado(number):
	colected[number] = "S"

func _on_Coletavel2_coletado(number):
	colected[number] = "S"

func _on_LevelEnder_levelEnded():
	Main.setColetaveis(colected[0], colected[1], colected[2])

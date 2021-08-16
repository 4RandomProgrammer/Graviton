extends Control

export (int)var collected = 0

var skins = {
	0: preload("res://Assets/Player/anim2.png"),
	1: preload("res://Assets/Player/GravySkins/redGravy.png"),
	2:preload("res://Assets/Player/GravySkins/blueGravy.png"),
	3:preload("res://Assets/Player/GravySkins/purpleGravy.png"),
	4:preload("res://Assets/Player/GravySkins/goldGravy.png"),
	5:preload("res://Assets/Player/GravySkins/computerGRavy.png"),
	6: preload("res://Assets/Player/GravySkins/cyberGravy.png"),
	7:preload("res://Assets/Player/GravySkins/vaporGravy.png"),
	8: preload("res://Assets/Player/GravySkins/bluemanGravy.png"),
	9: preload("res://Assets/Player/GravySkins/blueTendencyGravy.png"),
	10: preload("res://Assets/Player/GravySkins/redTendencyGravy.png"),
	11: preload("res://Assets/Player/GravySkins/MadelineGravy.png"),
	12: preload("res://Assets/Player/GravySkins/marioGravy.png"),
	13: preload("res://Assets/Player/GravySkins/yoshiGravy.png"),
	14: preload("res://Assets/Player/GravySkins/kirGravy.png")
	
}

func _ready():
	for vet in Main.collected:
		for moeda in vet:
			if moeda == "S":
				collected += 1
	update()

func update():
	$Coletados.set_text(str(collected) + "/21")
	if collected >= 1 :
		$Roupa1.disabled = false
	if collected >= 3:
		$Roupa2.disabled = false
	if collected >= 5:
		$Roupa3.disabled = false
	if collected >= 6:
		$Roupa4.disabled = false
	if collected >= 7:
		$Roupa5.disabled = false
	if collected >= 9:
		$Roupa6.disabled = false
	if collected >= 10:
		$Roupa7.disabled = false
	if collected >= 11:
		$Roupa8.disabled = false
	if collected >= 13:
		$Roupa9.disabled = false
	if collected >= 15:
		$Roupa10.disabled = false
	if collected >= 17:
		$Roupa11.disabled = false
	if collected >= 19:
		$Roupa12.disabled = false
	if collected >= 20:
		$Roupa13.disabled = false
	if collected >= 21:
		$Roupa14.disabled = false
		
	seeDisabled()

func seeDisabled():
	var i = 1
	while i < 15:
		var roupa = "Roupa" + str(i)
		self.get_node(roupa).isDisabled()
		i += 1

func _on_Back_pressed():
	self.visible = false

func _on_Roupa1_pressed():
	Main.playerSkin = 1
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa2_pressed():
	Main.playerSkin = 2
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa3_pressed():
	Main.playerSkin = 3

func _on_Roupa4_pressed():
	Main.playerSkin = 4
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa5_pressed():
	Main.playerSkin = 5
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa6_pressed():
	Main.playerSkin = 6
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa7_pressed():
	Main.playerSkin = 7
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa8_pressed():
	Main.playerSkin = 8
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa9_pressed():
	Main.playerSkin = 9
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa10_pressed():
	Main.playerSkin = 10
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa11_pressed():
	Main.playerSkin = 11
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa12_pressed():
	Main.playerSkin = 12
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa13_pressed():
	Main.playerSkin = 13
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_Roupa14_pressed():
	Main.playerSkin = 14
	$Sprite.set_texture(skins[Main.playerSkin])

func _on_NormalSkin_pressed():
	Main.playerSkin = 0
	$Sprite.set_texture(skins[Main.playerSkin])

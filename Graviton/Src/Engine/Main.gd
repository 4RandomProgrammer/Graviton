extends Node

var levels = {
	"Level0": preload("res://Src/Engine/LevelChooser.tscn"),
	"Level1": preload("res://Src/Areas/The-Basics.tscn"),
	"Level2": preload("res://Src/Areas/Rerversing.tscn"),
	"Level3":preload("res://Src/Areas/Desapearing.tscn"),
	"Level4":preload("res://Src/Areas/Ups and Downs.tscn"),
	"Level5":preload("res://Src/Areas/Rotating.tscn"),
	"Level6":preload("res://Src/Areas/Inverting and Moving.tscn")
}

var string = "0:0:0"
var currentLevel = 0
var fase = 0
var olderLevel = 0
var checkPoint = Vector2.ZERO
var speed = false
var seg = 0
var m = 0
var collected = [["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"]]

onready var anim = $CanvasLayer/Shader/AnimationPlayer

func getColetaveis():
	return collected[currentLevel]

func setColetaveis(colet1, colet2, colet3):
	collected[currentLevel][0] = colet1
	collected[currentLevel][1] = colet2
	collected[currentLevel][2] = colet3

func setFase(faseAtual):
	fase = faseAtual

func set_CheckPoint(pos):
	checkPoint = pos

func get_CheckPoint():
	return checkPoint

func chooseLevel(level):
	
	anim.play("Fade_out")
	
	match level:
		0:
			checkPoint = Vector2.ZERO
			fase = levels["Level0"].instance()
			currentLevel = 0
		1:
			fase = levels["Level1"].instance()
			currentLevel = 1
		2:
			fase = levels["Level2"].instance()
			currentLevel = 2
		3:
			fase = levels["Level3"].instance()
			currentLevel = 3
		4:
			fase = levels["Level4"].instance()
			currentLevel = 4
		5:
			fase = levels["Level5"].instance()
			currentLevel = 5
		6:
			fase = levels["Level6"].instance()
			currentLevel = 6

	self.add_child(fase)
	
	if speed and $SpeedrunTimer.is_stopped():
		$SpeedrunTimer.start()
	
#método para limpar a fase selecionada
func cleanup(level):
	if speed and level == 0:
		string = str(currentLevel) + ":" +  str(m) + ":" + str(seg)
		print(string)
		$SpeedrunTimer.stop()
		m = 0
		seg = 0

	anim.play("Fade_out")
	olderLevel = level
	start_music(olderLevel)
	$Timer.start()

func start_music(type):
	if type == 0:
		$LvMusic.stop()
		if !$MenuMusic.playing: 
			$MenuMusic.play()
	elif !$LvMusic.playing:
		$LvMusic.play()
		$MenuMusic.stop()

func setSpeed(speedVar):
	speed = speedVar

func stop_music():
	$LvMusic.playing = false
	$MenuMusic.playing = false

func set_vol(value):
	$LvMusic.volume_db = value

func startLevel():
	anim.play("Fade_in")

func _on_Timer_timeout():
	chooseLevel(olderLevel)

func _on_AnimationPlayer_animation_finished(animation):
	if animation == "Fade_out":
		fase.queue_free()
		

func _on_SpeedrunTimer_timeout():
	seg += 1
	
	if seg > 59:
		m += 1

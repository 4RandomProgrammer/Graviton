extends Node

var levels = {
	"Level0": preload("res://Src/Engine/LevelChooser.tscn"),
	"Level1": preload("res://Src/Areas/The-Basics.tscn"),
	"Level2": preload("res://Src/Areas/Rerversing.tscn"),
	"Level3":preload("res://Src/Areas/Desapearing.tscn"),
	"Level4":preload("res://Src/Areas/Ups and Downs.tscn"),
	"Level5":preload("res://Src/Areas/Rotating.tscn")
}

var fase = 0
var olderLevel = 0
var checkPoint = Vector2.ZERO

onready var anim = $CanvasLayer/Shader/AnimationPlayer

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
		1:
			fase = levels["Level1"].instance()
		2:
			fase = levels["Level2"].instance()
		3:
			fase = levels["Level3"].instance()
		4:
			fase = levels["Level4"].instance()
		5:
			fase = levels["Level5"].instance()

	self.add_child(fase)

#método para limpar a fase selecionada
func cleanup(level):
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
		

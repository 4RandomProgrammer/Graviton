extends Node

var levels = {
	"Level0": preload("res://Src/Engine/LevelChooser.tscn"),
	"Level1": preload("res://Src/Areas/The-Basics.tscn"),
	"Level2": preload("res://Src/Areas/Rerversing.tscn"),
	"Level3":preload("res://Src/Areas/Desapearing.tscn")
}

var fase = null
var olderLevel = null
var checkPoint = Vector2.ZERO
var musicTime = 0.0

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

	self.add_child(fase)

#método para limpar a fase selecionada
func cleanup(level):
	anim.play("Fade_out")
	olderLevel = level
	$Timer.start()


func set_musicTime(music):
	musicTime = music
	
func get_musicTime():
	return musicTime

func startLevel():
	anim.play("Fade_in")

func _on_Timer_timeout():
	chooseLevel(olderLevel)

func _on_AnimationPlayer_animation_finished(animation):
	if animation == "Fade_out":
		fase.queue_free()

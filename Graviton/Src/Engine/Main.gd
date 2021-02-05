extends Node

var levels = {
	"Level0": preload("res://Src/Engine/LevelChooser.tscn"),
	"Level1": preload("res://Src/Areas/The-Basics.tscn"),
	"Level2": preload("res://Src/Areas/Rerversing.tscn"),
}

var fase = null
var olderLevel = null

onready var anim = $CanvasLayer/Shader/AnimationPlayer

func setFase(faseAtual):
	fase = faseAtual

func chooseLevel(level):
	
	anim.play("Fade_out")
	
	match level:
		0:
			fase = levels["Level0"].instance()
		1:
			fase = levels["Level1"].instance()
		2:
			pass

	self.add_child(fase)

#método para limpar a fase selecionada
func cleanup(level):
	anim.play("Fade_out")
	olderLevel = level
	$Timer.start()

func startLevel():
	anim.play("Fade_in")

func _on_Timer_timeout():
	chooseLevel(olderLevel)

func _on_AnimationPlayer_animation_finished(animation):
	if animation == "Fade_out":
		fase.queue_free()

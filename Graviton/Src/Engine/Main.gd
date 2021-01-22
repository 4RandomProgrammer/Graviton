extends Node


var fase = null
var olderLevel = null

var levels = {
	"Level0": preload("res://Src/Engine/LevelChooser.tscn"),
	"Level1": preload("res://Src/Areas/The-Basics.tscn"),
	"Level2": preload("res://Src/Areas/Rerversing.tscn"),
}

func chooseLevel(level):
	
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
	fase.queue_free()
	olderLevel = level
	$Timer.start()



func _on_Timer_timeout():
	chooseLevel(olderLevel)

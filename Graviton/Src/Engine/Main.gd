extends Node


var fase = null

var levels = {
	"Level1": preload("res://Src/Areas/The-Basics.tscn"),
	"Level2": preload("res://Src/Areas/Rerversing.tscn"),
}

func chooseLevel(level):
	
	cleanup()
	
	match level:
		1:
			fase = levels["Level1"].instance()
		2:
			pass
	
	self.add_child(fase)

#método para limpar a fase selecionada
func cleanup():
	if fase != null:
		fase.queue_free()

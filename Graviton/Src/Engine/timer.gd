extends Label

var s = 0
var m = 0

func _physics_process(_delta):
	set_text(str(Main.m) + ":" + str(Main.seg))

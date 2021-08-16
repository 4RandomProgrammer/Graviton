extends Label

func _physics_process(_delta):
	set_text(str(Main.m) + ":" + str(Main.seg))

extends CheckBox

func _ready():
	set_focus_mode(true)

func showEnter():
	$Sprite.visible = true

func hideEnter():
	$Sprite.visible = false


func _on_CheckBox_focus_entered():
	showEnter()


func _on_CheckBox_focus_exited():
	hideEnter()

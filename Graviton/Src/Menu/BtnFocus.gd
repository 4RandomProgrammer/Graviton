extends TextureButton

func _ready():
	set_focus_mode(true)

func showEnter():
	$enter.visible = true

func hideEnter():
	$enter.visible = false

func isDisabled():
	if self.disabled:
		self.set_modulate(Color(0.5,0.5,0.5,1))

func _on_BtnFocus_focus_entered():
	showEnter()


func _on_BtnFocus_focus_exited():
	hideEnter()

func _on_BtnFocus_mouse_entered():
	grab_focus()

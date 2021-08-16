extends CanvasLayer

onready var soundEffects = $MenuSelectionSound

func _ready():
	Main.seg = 0
	Main.m = 0
	Main.startLevel()
	$VBoxContainer/Level1.grab_focus()
	$CheckBox.pressed = Main.speed

func _on_Level1_pressed():
	soundEffects.play()
	Main.cleanup(1, false)

func _on_Level2_pressed():
	soundEffects.play()
	Main.cleanup(2, false)

func _on_Level2_mouse_entered():
	$MenuHover.play()

func _on_Level1_mouse_entered():
	$MenuHover.play()


func _on_Level3_pressed():
	soundEffects.play()
	Main.cleanup(3, false)

func _on_Level3_mouse_entered():
	$MenuHover.play()


func _on_Level4_pressed():
	soundEffects.play()
	Main.cleanup(4, false)

func _on_Level4_mouse_entered():
	$MenuHover.play()

func _on_Level5_pressed():
	soundEffects.play()
	Main.cleanup(5, false)

func _on_Level5_mouse_entered():
	$MenuHover.play()

func _on_Level6_pressed():
	soundEffects.play()
	Main.cleanup(6, false)


func _on_Level6_mouse_entered():
	$MenuHover.play()

func _on_Level1_focus_entered():
	$MenuHover.play()


func _on_Level2_focus_entered():
	$MenuHover.play()


func _on_Level3_focus_entered():
	$MenuHover.play()


func _on_Level4_focus_entered():
	$MenuHover.play()


func _on_Level5_focus_entered():
	$MenuHover.play()


func _on_Level6_focus_entered():
	$MenuHover.play()


func _on_CheckBox_toggled(button_pressed):
	Main.setSpeed(button_pressed)

func _on_Tempos_pressed():
	$MenuTempo.visible = true
	$MenuTempo/BtnFocus.grab_focus()

func _on_Skins_pressed():
	$Roupinhas.visible = true
	$MenuSelectionSound.play()

func _on_BtnFocus_pressed():
	$Tempos.grab_focus()

func _on_Back_pressed():
	$Skins.grab_focus()


func _on_Level7_pressed():
	soundEffects.play()
	Main.cleanup(7, false)

func _on_Level7_focus_entered():
	$MenuHover.play()

func _on_Skins_focus_entered():
	$MenuHover.play()

func _on_Tempos_focus_entered():
	$MenuHover.play()

func _on_CheckBox_focus_entered():
	$MenuHover.play()

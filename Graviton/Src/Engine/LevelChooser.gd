extends CanvasLayer

onready var soundEffects = $MenuSelectionSound

func _ready():
	Main.seg = 0
	Main.m = 0
	Main.startLevel()
	$VBoxContainer/Level1.grab_focus()
	$Timers.set_text("tempos: \n1: " + Main.timers[1] + "\n" +
		"2: "  + Main.timers[2] + "\n" +
		"3: "  + Main.timers[3] + "\n" +
		"4: "  + Main.timers[4] + "\n"
		)
	$CheckBox.pressed = Main.speed

func _on_Level1_pressed():
	soundEffects.play()
	Main.cleanup(1)

func _on_Level2_pressed():
	soundEffects.play()
	Main.cleanup(2)

func _on_Level2_mouse_entered():
	$MenuHover.play()

func _on_Level1_mouse_entered():
	$MenuHover.play()


func _on_Level3_pressed():
	soundEffects.play()
	Main.cleanup(3)

func _on_Level3_mouse_entered():
	$MenuHover.play()



func _on_Level4_pressed():
	soundEffects.play()
	Main.cleanup(4)

func _on_Level4_mouse_entered():
	$MenuHover.play()

func _on_Level5_pressed():
	soundEffects.play()
	Main.cleanup(5)

func _on_Level5_mouse_entered():
	$MenuHover.play()

func _on_Level6_pressed():
	soundEffects.play()
	Main.cleanup(6)


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
	$Timers.visible = button_pressed


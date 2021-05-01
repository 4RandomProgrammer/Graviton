extends CanvasLayer

onready var soundEffects = $MenuSelectionSound

func _ready():
	Main.startLevel()

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



func _on_Button_pressed():
	soundEffects.play()
	Main.cleanup(4)


func _on_Button_mouse_entered():
	$MenuHover.play()


func _on_Level5_pressed():
	soundEffects.play()
	Main.cleanup(5)

func _on_Level5_mouse_entered():
	$MenuHover.play()

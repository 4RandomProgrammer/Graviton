extends CanvasLayer

onready var soundEffects = $MenuSelectionSound

func _ready():
	Main.setFase(self)
	Main.startLevel()

func _on_Level1_pressed():
	soundEffects.play()
	Main.cleanup(1)

func _on_Level2_pressed():
	soundEffects.play()
	Main.cleanup(2)

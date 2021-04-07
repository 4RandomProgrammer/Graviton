extends StaticBody2D

export (int) var rotDir = 0

func _ready():
	if(rotDir == 1):
		$AnimationPlayer.play_backwards("Rotation")
	else:
		$AnimationPlayer.play("Rotation")

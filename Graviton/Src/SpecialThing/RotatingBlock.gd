extends KinematicBody2D

export (int) var rotDir = 0

func _ready():
	if(rotDir == 1):
		$AnimationPlayer.play("InverseRotation")
	else:
		$AnimationPlayer.play("Rotation")

extends Camera2D

#const LOOKAHEADFACTOR = 0.2
#const SHIFTTRANS = Tween.TRANS_SINE
#const SHIFTEASE = Tween.EASE_OUT
#const SHIFTDURATION = 1
#
#var facing = 0
#
#onready var prevCameraPos = get_camera_position()
#onready var shiftTween = $ShiftTween
#
#func _process(_delta):
#	checkFacing()
#	prevCameraPos = get_camera_position()
#
#func checkFacing():
#
#	var newFacing = sign(get_camera_position().x - prevCameraPos.x)
#
#	if newFacing != 0 && facing != newFacing:
#		facing = newFacing
#		var targetOffset = get_viewport().size.x * facing * LOOKAHEADFACTOR
#
#		shiftTween.interpolate_property(self, "position:x", position.x, targetOffset, SHIFTDURATION, SHIFTTRANS, SHIFTEASE)
#		shiftTween.start()

func _on_Player_groundedUptaded(isGrounded):
	drag_margin_v_enabled = !isGrounded

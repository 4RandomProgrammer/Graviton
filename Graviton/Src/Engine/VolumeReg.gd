extends HSlider

export (int) var audioFor = 0

var hoverRef = {
	"pressed": preload("res://Assets/Menus/unmute.png"),
	"unpressed":preload("res://Assets/Menus/desmute.png")
}
var hover = hoverRef["pressed"]
var oldVolume = 0
var mute = true

func _ready():
	$Volume.set_text(AudioServer.get_bus_name(audioFor) + " volume:")
	$Value.set_text(str(db2linear(AudioServer.get_bus_volume_db(audioFor)) * 100))
	self.value = db2linear(AudioServer.get_bus_volume_db(audioFor)) * 100
	
func _on_VolumeReg_value_changed(value):

	$Value.set_text(str(value))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(AudioServer.get_bus_name(audioFor)), linear2db(value/100))


func _on_Button_pressed():
	if(mute):
		hover = hoverRef["pressed"]
		$Button.texture_normal  = hover
		$Button.texture_pressed  = hover
		$Button.texture_hover = hoverRef["unpressed"]
		print($Button.texture_hover)
		oldVolume = (db2linear(AudioServer.get_bus_volume_db(audioFor)))
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index(AudioServer.get_bus_name(audioFor)), linear2db(0))
		$Value.set_text(str(db2linear(AudioServer.get_bus_volume_db(audioFor)) * 100))
		self.value = db2linear(AudioServer.get_bus_volume_db(audioFor)) * 100
		mute = !mute
	else:
		hover = hoverRef["unpressed"]
		$Button.texture_normal  = hover
		$Button.texture_pressed  = hover
		$Button.texture_hover = hoverRef["pressed"]
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index(AudioServer.get_bus_name(audioFor)), linear2db(oldVolume))
		$Value.set_text(str(db2linear(AudioServer.get_bus_volume_db(audioFor)) * 100))
		self.value = db2linear(AudioServer.get_bus_volume_db(audioFor)) * 100
		mute = !mute

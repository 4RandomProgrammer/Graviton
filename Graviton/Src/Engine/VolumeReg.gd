extends HSlider

var oldVolume = 0
var trigger = true

func _ready():
	$Value.set_text(str(db2linear(AudioServer.get_bus_volume_db(0)) * 100))
	self.value = db2linear(AudioServer.get_bus_volume_db(0)) * 100
	
func _on_VolumeReg_value_changed(value):
	$Value.set_text(str(value))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(value/100))


func _on_Button_pressed():
	if(trigger):
		oldVolume = (db2linear(AudioServer.get_bus_volume_db(0)))
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(0))
		$Value.set_text(str(db2linear(AudioServer.get_bus_volume_db(0)) * 100))
		self.value = db2linear(AudioServer.get_bus_volume_db(0)) * 100
		trigger = !trigger
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(oldVolume))
		$Value.set_text(str(db2linear(AudioServer.get_bus_volume_db(0)) * 100))
		self.value = db2linear(AudioServer.get_bus_volume_db(0)) * 100
		trigger = !trigger

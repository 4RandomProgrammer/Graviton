extends Control

var minutes = 0
var seconds = 0

func _ready():
	var stringLMS = Main.string.split(":")
	minutes = int(stringLMS[1])
	seconds = int(stringLMS[2])
	
	if !(seconds == 0 and minutes == 0):
		calculate(int(stringLMS[0]))
	rewrite()

func calculate(level):
	var times = Main.timers[level]
	times = times.split(":")
	
	if times[0] == "0" and times[1] == "0":
		Main.timers[level] = str(minutes) + ":" + str(seconds)
	elif int(times[0]) * 60 + int(times[1]) > minutes * 60 + seconds:
		Main.timers[level] = str(minutes) + ":" + str(seconds)
	else:
		pass
	


func rewrite():
	$Tempos.set_text(
		"1: " + Main.timers[1] + "\n" +
		"2: " + Main.timers[2] + "\n" +
		"3: " + Main.timers[3] + "\n" +
		"4: " + Main.timers[4] + "\n" +
		"5: " + Main.timers[5] + "\n" +
		"6: " + Main.timers[6] + "\n" +
		"7: " + Main.timers[7] + "\n"
	)

func _on_BtnFocus_pressed():
	self.visible = false

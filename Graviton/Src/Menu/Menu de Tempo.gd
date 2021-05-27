extends Control

var timers = ["0:0", "0:0", "0:0", "0:0", "0:0", "0:0", "0:0", "0:0"]
var minutes = 0
var seconds = 0

func _ready():
	var stringLMS = Main.string.split(":")
	minutes = int(stringLMS[1])
	seconds = int(stringLMS[2])
	
	
	if !(seconds == 0 and minutes == 0):
		calculate(int(stringLMS[0]))
	

func calculate(level):
	var times = timers[level].split(":")
	print(times)
	if times[0] == "0" and times[1] == "0":
		timers[level] = str(minutes) + ":" + str(seconds)
		print("Timer cond1: " + timers[level])
	elif int(times[0]) * 60 + int(times[1]) > minutes * 60 + seconds:
		print(str(minutes) + ":" + str(seconds))
		timers[level] = str(minutes) + ":" + str(seconds)
		print("Timer cond2: " + timers[level])
	else:
		pass
	
	rewrite()

func rewrite():
	$Tempos.set_text(
		"1: " + timers[1] + "\n" +
		"2: " + timers[2] + "\n" +
		"3: " + timers[3] + "\n" +
		"4: " + timers[4] + "\n" +
		"5: " + timers[5] + "\n" +
		"6: " + timers[6] + "\n" +
		"7: " + timers[7] + "\n"
	)

func _on_BtnFocus_pressed():
	self.visible = false

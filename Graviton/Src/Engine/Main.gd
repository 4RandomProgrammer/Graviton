extends Node

var levels = {
	"Level0": preload("res://Src/Engine/LevelChooser.tscn"),
	"Level1": preload("res://Src/Areas/The-Basics.tscn"),
	"Level2": preload("res://Src/Areas/Rerversing.tscn"),
	"Level3":preload("res://Src/Areas/Desapearing.tscn"),
	"Level4":preload("res://Src/Areas/Ups and Downs.tscn"),
	"Level5":preload("res://Src/Areas/Rotating.tscn"),
	"Level6":preload("res://Src/Areas/Inverting and Moving.tscn"),
	"Level7":preload("res://Src/Areas/TheEnd.tscn")
}

const SAVE_PATH = "res://save.json"

var playerSkin = 0
var timers = ["0:0", "0:0", "0:0", "0:0", "0:0", "0:0", "0:0", "0:0"]
var string = "0:0:0"
var currentLevel = 0
var fase = 0
var olderLevel = 0
export var checkPoint = Vector2.ZERO
var speed = false
var seg = 0
var m = 0
var collected = [["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"], ["N", "N", "N"]]

onready var anim = $CanvasLayer/Shader/AnimationPlayer

func getColetaveis():
	return collected[currentLevel]

func setColetaveis(colet1, colet2, colet3):
	collected[currentLevel][0] = colet1
	collected[currentLevel][1] = colet2
	collected[currentLevel][2] = colet3

func setFase(faseAtual):
	fase = faseAtual

func set_CheckPoint(pos):
	checkPoint = pos

func get_CheckPoint():
	return checkPoint

func chooseLevel(level):
	
	anim.play("Fade_out")
	
	match level:
		0:
			checkPoint = Vector2.ZERO
			fase = levels["Level0"].instance()
			currentLevel = 0
		1:
			fase = levels["Level1"].instance()
			currentLevel = 1
		2:
			fase = levels["Level2"].instance()
			currentLevel = 2
		3:
			fase = levels["Level3"].instance()
			currentLevel = 3
		4:
			fase = levels["Level4"].instance()
			currentLevel = 4
		5:
			fase = levels["Level5"].instance()
			currentLevel = 5
		6:
			fase = levels["Level6"].instance()
			currentLevel = 6
		7:
			fase = levels["Level7"].instance()
			currentLevel = 7
	
	self.add_child(fase)
	
	if speed and $SpeedrunTimer.is_stopped() and level != 0:
		$SpeedrunTimer.start(1)
	
#método para limpar a fase selecionada
func cleanup(level, tosave):
	if speed and level == 0:
		string = str(currentLevel) + ":" +  str(m) + ":" + str(seg)
		$SpeedrunTimer.stop()
		m = 0
		seg = 0
	
	#Indica quando que vai ser salvo
	if level == 0 and tosave:
		saveGame()
	
	anim.play("Fade_out")
	olderLevel = level
	start_music(olderLevel)
	$Timer.start()

func start_music(type):
	if type == 0:
		$LvMusic.stop()
		if !$MenuMusic.playing: 
			$MenuMusic.play()
	elif !$LvMusic.playing:
		$LvMusic.play()
		$MenuMusic.stop()

func setSpeed(speedVar):
	speed = speedVar

func stop_music():
	$LvMusic.playing = false
	$MenuMusic.playing = false

func set_vol(value):
	$LvMusic.volume_db = value

func startLevel():
	anim.play("Fade_in")

func saveGame():
	#preciso salvar:
	#tempos e quantas moedas coletadas.
	var save_file = File.new()
	var save_dict = createDict()
	
	save_file.open(SAVE_PATH, File.WRITE)
	save_file.store_line(to_json(save_dict))
	save_file.close()
	pass

func loadGame():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		return
	
	save_file.open(SAVE_PATH, File.READ)
	var data = {}
	data = parse_json(save_file.get_as_text())
	
	#put it back
	for i in data.keys():
		for j in data[i]:
			
			if j == "tempo":
				print(data[i][j])
				timers[int(i)] = data[i][j];
			else:
				collected[int(i)][int(j) - 1] = data[i][j]
	
	pass

func createDict():
	var saveDict = {
		level1 = {
			tempo = timers[1],
			coin1 = collected[1][0],
			coin2 = collected[1][1],
			coin3 = collected[1][2]
		},
		level2 = {
			tempo = timers[2],
			coin1 = collected[2][0],
			coin2 = collected[2][1],
			coin3 = collected[2][2]
		},
		level3 = {
			tempo = timers[3],
			coin1 = collected[3][0],
			coin2 = collected[3][1],
			coin3 = collected[3][2]
		},
		level4 = {
			tempo = timers[4],
			coin1 = collected[4][0],
			coin2 = collected[4][1],
			coin3 = collected[4][2]
		},
		level5 = {
			tempo = timers[5],
			coin1 = collected[5][0],
			coin2 = collected[5][1],
			coin3 = collected[5][2]
		},
		level6 = {
			tempo = timers[6],
			coin1 = collected[6][0],
			coin2 = collected[6][1],
			coin3 = collected[6][2]
		},
		level7 = {
			tempo = timers[7],
			coin1 = collected[7][0],
			coin2 = collected[7][1],
			coin3 = collected[7][2]
		}
	}
	
	return saveDict

func _on_Timer_timeout():
	chooseLevel(olderLevel)

func _on_AnimationPlayer_animation_finished(animation):
	if animation == "Fade_out":
		fase.queue_free()
	
func _on_SpeedrunTimer_timeout():
	seg += 1
	
	if seg > 59:
		m += 1

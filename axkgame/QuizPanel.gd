extends Control

var gMesg = [
	"You Got That Right!",
	"Correct!",
	"Woah! That Was Out Of This WORLD!",
	"Good Job! Let's See The Next One!",
	"You Got This In The Bag!",
	"Keep Up The Hard Work",
]

var wMesg = [
	"Better Luck Next Time :(",
	"Just Barely...",
	"Almost Got It!",
	"Incorrect!",
	"Let's Try That Again",
]

var rng = RandomNumberGenerator.new()

func checkAnswer(emotion):
	print("You Chose "+emotion+", Computer gave "+get_tree().current_scene.currEmotion)
	if get_tree().current_scene.currEmotion == str(emotion):
		get_tree().current_scene.score += 1
		$pc/hbx/v1/message.text = gMesg[rng.randi_range(0,len(gMesg)-1)]
	else:
		$pc/hbx/v1/message.text = wMesg[rng.randi_range(0,len(wMesg)-1)]
	get_tree().current_scene.clearAllEmotions()
	get_tree().current_scene.setRandomEmotion()
	$pc/hbx/v2/score.text = "Score: "+str(get_tree().current_scene.score)


func _on_QBHappy_pressed():
	checkAnswer("Happy")


func _on_QBSad_pressed():
	checkAnswer("Sad")


func _on_QBAngry_pressed():
	checkAnswer("Angry")


func _on_QBDisgust_pressed():
	checkAnswer("Disgust")


func _on_QBFear_pressed():
	checkAnswer("Fear")

func _on_QBSurprise_pressed():
	checkAnswer("Surprise")

func _on_closebutton_pressed():
	hide()

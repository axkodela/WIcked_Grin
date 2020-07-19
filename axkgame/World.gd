extends Spatial

var currentModel
var emotions
var currEmotion
var rng
var score

func _ready():
	_on_M1select_pressed()
	$skyBox.show()
	$apx.play(0)
	rng = RandomNumberGenerator.new()
	emotions = ["Happy", "Sad", "Angry", "Fear"]
	$Camera/QuizPanel.hide()

func modValue(value):
	return value/100


func hide_all_models():
	for n in get_tree().get_nodes_in_group("MMESH"):
		n.hide()

func playSFX(filename):
	if $afx.playing == false:
		$afx.stream = load("res://Effects/"+str(filename))
		$afx.stream.loop_mode=false
		$afx.play(0)
		$afx.autoplay=false


func clearAllEmotions():
	for n in emotions:
		currentModel.set("blend_shapes/"+n, 0)

func clearAllSliders():
	print("clearing sliders")
	for n in get_tree().get_nodes_in_group("slider"):
		print("setting value of ",n.name)
		n.value=0


func setRandomEmotion():
	currEmotion = emotions[rng.randi_range(0,3)]
#	for n in emotions:
#		if n != currEmotion:
#			currentModel.set("blend_shapes/"+n, 0.04)
#			print("we are setting the emotion "+n+" to 0.04")
#		else:
#			print("we already set this emotion- "+ currEmotion)
	currentModel.set("blend_shapes/"+currEmotion, 0.8)
	$Camera/Control/HBoxContainer/SldsandButtons/Debug.text = currEmotion
	

func _on_HSlider1_value_changed(value):
	currentModel.set("blend_shapes/Happy", modValue(value))
	playSFX("happy.wav")


func _on_HSlider2_value_changed(value):
	currentModel.set("blend_shapes/Sad", modValue(value))
	playSFX("sad.wav")


func _on_HSlider3_value_changed(value):
	currentModel.set("blend_shapes/Angry", modValue(value))
	playSFX("angry.wav")



func _on_HSlider5_value_changed(value):
	currentModel.set("blend_shapes/Fear", modValue(value))
	playSFX("fear.wav")


func _on_HSlider4_value_changed(value):
	currentModel.set("blend_shapes/Weird1", modValue(value))
	playSFX("weird.wav")


func _on_HSlider6_value_changed(value):
	currentModel.set("blend_shapes/Weird2", modValue(value))
	playSFX("weird.wav")


func _on_HSlider7_value_changed(value):
	currentModel.set("blend_shapes/Weird3", modValue(value))
	playSFX("weird.wav")


func _on_Quit_pressed():
	get_tree().quit()

func _on_Quiz_pressed():
	clearAllEmotions()
	setRandomEmotion()
	score = 0
	$Camera/QuizPanel.show()



func _on_M1select_pressed():
	if currentModel:clearAllEmotions()
	clearAllSliders()
	hide_all_models()
	currentModel = $m1.get_node("mesh")
	$m1.show()
	
func _on_M2select_pressed():
	if currentModel:clearAllEmotions()
	clearAllSliders()
	hide_all_models()
	currentModel = $m2.get_node("mesh")
	$m2.show()

func _on_M3select_pressed():
	if currentModel:clearAllEmotions()
	clearAllSliders()
	hide_all_models()
	currentModel = $m3.get_node("mesh")
	$m3.show()

func _on_M4select_pressed():
	if currentModel:clearAllEmotions()
	clearAllSliders()
	hide_all_models()
	currentModel = $m4.get_node("mesh")
	$m4.show()

func _on_M5select_pressed():
	if currentModel:clearAllEmotions()
	clearAllSliders()
	hide_all_models()
	currentModel = $m5.get_node("mesh")
	$m5.show()

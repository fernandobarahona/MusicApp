extends Node2D

export(Vector2) var btn_scale_anim = Vector2(1.2,1.2)
export(float) var btn_anim_time = 0.2


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.current_scene = GameManager.scene.MainMenu
	get_tree().set_quit_on_go_back(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _exit_tree():
	GameManager.prev_scene = GameManager.scene.MainMenu


func _on_btnGame_pressed():
	$Effet.interpolate_property($HUD/Bg/btnGame, 'scale', $HUD/Bg/btnGame.get_scale(), Vector2(1,1), btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()
	get_tree().change_scene("res://Scenes/Mains/GameScene.tscn")


func _on_btnConfig_pressed():
	$Effet.interpolate_property($HUD/Bg/btnConfig, 'scale', $HUD/Bg/btnConfig.get_scale(), Vector2(1,1), btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()	
	get_tree().change_scene("res://Scenes/Mains/ConfigMenu.tscn")


func _on_btnCredit_pressed():
	$Effet.interpolate_property($HUD/Bg/btnAbout, 'scale', $HUD/Bg/btnAbout.get_scale(), Vector2(1,1), btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()
	get_tree().change_scene("res://Scenes/Mains/Credits.tscn")

func _on_btnPractice_pressed():
	$Effet.interpolate_property($HUD/Bg/btnPractice, 'scale', $HUD/Bg/btnPractice.get_scale(), Vector2(1,1), btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()
# warning-ignore:return_value_discarded
	OS.shell_open("https://leandrodreamer.itch.io/partitura")


func _on_btnLogin_pressed():
	$Effet.interpolate_property($HUD/Bg/btnLogin, 'rect_scale', $HUD/Bg/btnLogin.get_scale(), Vector2(1,1), btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()




func _on_btnLogin_button_down():
	$Effet.interpolate_property($HUD/Bg/btnLogin, 'rect_scale', $HUD/Bg/btnLogin.get_scale(), btn_scale_anim, btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()

func _on_btnConfig_button_down():
	$Effet.interpolate_property($HUD/Bg/btnConfig, 'scale', $HUD/Bg/btnConfig.get_scale(), btn_scale_anim, btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()


func _on_btnAbout_button_down():
	$Effet.interpolate_property($HUD/Bg/btnAbout, 'scale', $HUD/Bg/btnAbout.get_scale(), btn_scale_anim, btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()


func _on_btnPractice_button_down():
	$Effet.interpolate_property($HUD/Bg/btnPractice, 'scale', $HUD/Bg/btnPractice.get_scale(), btn_scale_anim, btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()


func _on_btnGame_button_down():
	$Effet.interpolate_property($HUD/Bg/btnGame, 'scale', $HUD/Bg/btnGame.get_scale(), btn_scale_anim, btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()

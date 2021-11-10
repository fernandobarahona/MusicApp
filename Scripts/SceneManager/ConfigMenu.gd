extends Node2D


export(Vector2) var btn_scale_anim = Vector2(1.2,1.2)
export(float) var btn_anim_time = 0.2

func _ready():
	GameManager.current_scene = GameManager.scene.ConfigMenu
	get_tree().set_quit_on_go_back(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _exit_tree():
	GameManager.prev_scene = GameManager.scene.ConfigMenu

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		# For Windows
		get_tree().change_scene("res://Scenes/Mains/MainMenu.tscn")
		  
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST: 
		# For android
		if GameManager.prev_scene == GameManager.scene.MainMenu:
			get_tree().change_scene("res://Scenes/Mains/MainMenu.tscn")
		elif GameManager.prev_scene == GameManager.scene.GameScene:
			get_tree().change_scene("res://Scenes/Mains/GameScene.tscn")


func _on_btn_pressed():
	$Effet.interpolate_property($HUD/bg/btnBack, 'rect_scale', $HUD/bg/btnBack.get_scale(), Vector2(1,1), btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()
	if GameManager.prev_scene == GameManager.scene.MainMenu:
		get_tree().change_scene("res://Scenes/Mains/MainMenu.tscn")
	elif GameManager.prev_scene == GameManager.scene.GameScene:
		get_tree().change_scene("res://Scenes/Mains/GameScene.tscn")


func _on_btnBack_button_down():
	$Effet.interpolate_property($HUD/bg/btnBack, 'rect_scale', $HUD/bg/btnBack.get_scale(), btn_scale_anim, btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()


func _on_btnAdd_button_down():
	$Effet.interpolate_property($HUD/bg/pnaleSpeed/btnAdd, 'scale', $HUD/bg/pnaleSpeed/btnAdd.get_scale(), btn_scale_anim, btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()


func _on_btnRemove_button_down():
	$Effet.interpolate_property($HUD/bg/pnaleSpeed/btnRemove, 'scale', $HUD/bg/pnaleSpeed/btnRemove.get_scale(), btn_scale_anim, btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()


func _on_btnRemove_pressed():
	$Effet.interpolate_property($HUD/bg/pnaleSpeed/btnRemove, 'scale', $HUD/bg/pnaleSpeed/btnRemove.get_scale(), Vector2(1,1), btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()


func _on_btnAdd_pressed():
	$Effet.interpolate_property($HUD/bg/pnaleSpeed/btnAdd, 'scale', $HUD/bg/pnaleSpeed/btnAdd.get_scale(), Vector2(1,1), btn_anim_time, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

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

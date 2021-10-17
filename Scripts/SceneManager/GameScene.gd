extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	GameManager.current_scene = GameManager.scene.GameScene
	get_tree().set_quit_on_go_back(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _exit_tree():
	GameManager.prev_scene = GameManager.scene.GameScene
	
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		# For Windows
		$HUD/PopupLeave.visible = true
		  
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST: 
		# For android
		$HUD/PopupLeave.visible = true


func _on_btnConfig_pressed():
	get_tree().change_scene("res://Scenes/Mains/ConfigMenu.tscn")

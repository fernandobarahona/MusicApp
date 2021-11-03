extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


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
	get_tree().change_scene("res://Scenes/Mains/GameScene.tscn")


func _on_btnConfig_pressed():
	get_tree().change_scene("res://Scenes/Mains/ConfigMenu.tscn")


func _on_btnCredit_pressed():
	get_tree().change_scene("res://Scenes/Mains/Credits.tscn")


func _on_btnPractice_pressed():
	OS.shell_open("https://leandrodreamer.itch.io/partitura")


func _on_btnLogin_pressed():
	pass # Replace with function body.


func _on_btnGame_gui_input(event):
	if event.is_pressed():
		print("click")
		$Effet.interpolate_property($HUD/Bg/btnGame, 'transform/scale',
		$HUD/Bg/btnGame.get_scale(), Vector2(2.0, 2.0), 0.3,
		Tween.TRANS_QUAD, Tween.EASE_OUT) 

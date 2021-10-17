extends Node2D

export(float) var timeSplash = 2

var timeSplashCounter
var loadingScene = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.current_scene = GameManager.scene.SplashScreen
	timeSplashCounter = timeSplash


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if loadingScene:
		return
		
	timeSplashCounter -= delta
	if timeSplashCounter <= 0:
		loadingScene = true
		get_tree().change_scene("res://Scenes/Mains/MainMenu.tscn")


func _exit_tree():
	GameManager.prev_scene = GameManager.scene.SplashScreen

extends Node

enum scene {SplashScreen, MainMenu, GameScene, ConfigMenu, Credits}

enum Notes {C, D, E, F, G, A, B, Db, Eb, Gb, Ab, Bb}

enum Octave {oct_0, oct_1, oct_2, oct_3, oct_4, oct_5, oct_6, oct_7, oct_8}

var current_scene
var prev_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

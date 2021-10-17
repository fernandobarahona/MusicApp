extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_C_pressed():
	$C/Player.play()


func _on_D_pressed():
	$D/Player.play()


func _on_E_pressed():
	$E/Player.play()


func _on_F_pressed():
	$F/Player.play()


func _on_G_pressed():
	$G/Player.play()


func _on_A_pressed():
	$A/Player.play()


func _on_B_pressed():
	$B/Player.play()


func _on_Db_pressed():
	$Db/Player.play()


func _on_Eb_pressed():
	$Eb/Player.play()


func _on_Gb_pressed():
	$Gb/Player.play()


func _on_Ab_pressed():
	$Ab/Player.play()


func _on_Bb_pressed():
	$Bb/Player.play()

extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var last_20_try = 0
var last_20_try_corrected = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$smallProgressBar/Label.text = "0% try corrected"
	$smallProgressBar/TextureProgress.value = 0
	$bigProgressBar/Label.text = "0%"
	$bigProgressBar/TextureProgress.value = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Sheet_after_piano_key_pressed_evaluated(nb_try, nb_try_correct, corrected):
	if nb_try > 0:
		$smallProgressBar/Label.text = str((100*nb_try_correct)/nb_try)+"% try corrected"
		$smallProgressBar/TextureProgress.value = int((100*nb_try_correct)/nb_try)
		
		last_20_try += 1
		if corrected:
			last_20_try_corrected += 1
		
		if nb_try% 20 == 0:
			$bigProgressBar/Label.text = str((100*last_20_try_corrected)/last_20_try)+"%"
			$bigProgressBar/TextureProgress.value = int((100*last_20_try_corrected)/last_20_try)
			last_20_try = 0
			last_20_try_corrected = 0
			

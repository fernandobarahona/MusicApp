extends Button


export(GameManager.Notes) var key_note


export(Color) var btn_color


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _pressed():
	get_parent().get_node("Effet").interpolate_property(self, 'rect_scale', get_scale(), Vector2(1,1), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)
	get_parent().get_node("Effet").start()	
	
	

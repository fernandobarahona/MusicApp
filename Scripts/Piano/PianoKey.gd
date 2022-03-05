extends Button


export(GameManager.Notes) var key_note

export(bool) var flated


export(Color) var btn_color


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("button_down", self, "_button_down")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _pressed():
	get_parent().get_node("Effet").interpolate_property(self, 'rect_scale', get_scale(), Vector2(1,1), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)
	get_parent().get_node("Effet").start()	

func _button_down():
	print("button down")
	get_parent().get_node("Effet").interpolate_property(self, 'rect_scale', get_scale(), Vector2(1,0.98), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)
	get_parent().get_node("Effet").start()	
	get_parent().emit_signal("piano_key_pressed", Note.new(key_note,get_parent().octave, flated), self)

	match get_parent().octave:
		GameManager.Octave.oct_1: $Player1.play()
		GameManager.Octave.oct_2: $Player2.play()
		GameManager.Octave.oct_3: $Player3.play()
		GameManager.Octave.oct_4: $Player4.play()
		GameManager.Octave.oct_5: $Player5.play()
		GameManager.Octave.oct_6: $Player6.play()
		GameManager.Octave.oct_7: $Player7.play()
		GameManager.Octave.oct_8: $Player8.play()


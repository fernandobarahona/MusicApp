extends Control


signal piano_key_pressed(note, btn)

export(GameManager.Octave) var octave = GameManager.Octave.oct_4


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_C_button_down():

	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.C,octave), $C)

	match octave:
		GameManager.Octave.oct_1: $C/Player1.play()
		GameManager.Octave.oct_2: $C/Player2.play()
		GameManager.Octave.oct_3: $C/Player3.play()
		GameManager.Octave.oct_4: $C/Player4.play()
		GameManager.Octave.oct_5: $C/Player5.play()
		GameManager.Octave.oct_6: $C/Player6.play()
		GameManager.Octave.oct_7: $C/Player7.play()
		GameManager.Octave.oct_8: $C/Player8.play()
	


func _on_D_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.D,octave), $D)
	match octave:
		GameManager.Octave.oct_1: $D/Player1.play()
		GameManager.Octave.oct_2: $D/Player2.play()
		GameManager.Octave.oct_3: $D/Player3.play()
		GameManager.Octave.oct_4: $D/Player4.play()
		GameManager.Octave.oct_5: $D/Player5.play()
		GameManager.Octave.oct_6: $D/Player6.play()
		GameManager.Octave.oct_7: $D/Player7.play()


func _on_E_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.E,octave), $E)
	match octave:
		GameManager.Octave.oct_1: $E/Player1.play()
		GameManager.Octave.oct_2: $E/Player2.play()
		GameManager.Octave.oct_3: $E/Player3.play()
		GameManager.Octave.oct_4: $E/Player4.play()
		GameManager.Octave.oct_5: $E/Player5.play()
		GameManager.Octave.oct_6: $E/Player6.play()
		GameManager.Octave.oct_7: $E/Player7.play()


func _on_F_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.F,octave), $F)
	match octave:
		GameManager.Octave.oct_1: $F/Player1.play()
		GameManager.Octave.oct_2: $F/Player2.play()
		GameManager.Octave.oct_3: $F/Player3.play()
		GameManager.Octave.oct_4: $F/Player4.play()
		GameManager.Octave.oct_5: $F/Player5.play()
		GameManager.Octave.oct_6: $F/Player6.play()
		GameManager.Octave.oct_7: $F/Player7.play()


func _on_G_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.G,octave), $G)
	match octave:
		GameManager.Octave.oct_1: $G/Player1.play()
		GameManager.Octave.oct_2: $G/Player2.play()
		GameManager.Octave.oct_3: $G/Player3.play()
		GameManager.Octave.oct_4: $G/Player4.play()
		GameManager.Octave.oct_5: $G/Player5.play()
		GameManager.Octave.oct_6: $G/Player6.play()
		GameManager.Octave.oct_7: $G/Player7.play()


func _on_A_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.A,octave), $A)
	match octave:
		GameManager.Octave.oct_0: $A/Player0.play()
		GameManager.Octave.oct_1: $A/Player1.play()
		GameManager.Octave.oct_2: $A/Player2.play()
		GameManager.Octave.oct_3: $A/Player3.play()
		GameManager.Octave.oct_4: $A/Player4.play()
		GameManager.Octave.oct_5: $A/Player5.play()
		GameManager.Octave.oct_6: $A/Player6.play()
		GameManager.Octave.oct_7: $A/Player7.play()


func _on_B_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.B,octave), $B)
	match octave:
		GameManager.Octave.oct_0: $B/Player0.play()
		GameManager.Octave.oct_1: $B/Player1.play()
		GameManager.Octave.oct_2: $B/Player2.play()
		GameManager.Octave.oct_3: $B/Player3.play()
		GameManager.Octave.oct_4: $B/Player4.play()
		GameManager.Octave.oct_5: $B/Player5.play()
		GameManager.Octave.oct_6: $B/Player6.play()
		GameManager.Octave.oct_7: $B/Player7.play()


func _on_Db_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.Db,octave), $Db)
	match octave:
		GameManager.Octave.oct_0: $Db/Player0.play()
		GameManager.Octave.oct_1: $Db/Player1.play()
		GameManager.Octave.oct_2: $Db/Player2.play()
		GameManager.Octave.oct_3: $Db/Player3.play()
		GameManager.Octave.oct_4: $Db/Player4.play()
		GameManager.Octave.oct_5: $Db/Player5.play()
		GameManager.Octave.oct_6: $Db/Player6.play()
		GameManager.Octave.oct_7: $Db/Player7.play()


func _on_Eb_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.Eb,octave), $Eb)
	match octave:
		GameManager.Octave.oct_1: $Eb/Player1.play()
		GameManager.Octave.oct_2: $Eb/Player2.play()
		GameManager.Octave.oct_3: $Eb/Player3.play()
		GameManager.Octave.oct_4: $Eb/Player4.play()
		GameManager.Octave.oct_5: $Eb/Player5.play()
		GameManager.Octave.oct_6: $Eb/Player6.play()
		GameManager.Octave.oct_7: $Eb/Player7.play()


func _on_Gb_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.Gb,octave), $Gb)
	match octave:
		GameManager.Octave.oct_1: $Gb/Player1.play()
		GameManager.Octave.oct_2: $Gb/Player2.play()
		GameManager.Octave.oct_3: $Gb/Player3.play()
		GameManager.Octave.oct_4: $Gb/Player4.play()
		GameManager.Octave.oct_5: $Gb/Player5.play()
		GameManager.Octave.oct_6: $Gb/Player6.play()
		GameManager.Octave.oct_7: $Gb/Player7.play()


func _on_Ab_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.Ab,octave), $Ab)
	match octave:
		GameManager.Octave.oct_1: $Ab/Player1.play()
		GameManager.Octave.oct_2: $Ab/Player2.play()
		GameManager.Octave.oct_3: $Ab/Player3.play()
		GameManager.Octave.oct_4: $Ab/Player4.play()
		GameManager.Octave.oct_5: $Ab/Player5.play()
		GameManager.Octave.oct_6: $Ab/Player6.play()
		GameManager.Octave.oct_7: $Ab/Player7.play()


func _on_Bb_button_down():
	emit_signal("piano_key_pressed", Note.new(GameManager.Notes.Bb,octave), $Bb)
	match octave:
		GameManager.Octave.oct_0: $Bb/Player0.play()
		GameManager.Octave.oct_1: $Bb/Player1.play()
		GameManager.Octave.oct_2: $Bb/Player2.play()
		GameManager.Octave.oct_3: $Bb/Player3.play()
		GameManager.Octave.oct_4: $Bb/Player4.play()
		GameManager.Octave.oct_5: $Bb/Player5.play()
		GameManager.Octave.oct_6: $Bb/Player6.play()
		GameManager.Octave.oct_7: $Bb/Player7.play()



func _on_Sheet_note_displayed(note):
	octave = note.octave

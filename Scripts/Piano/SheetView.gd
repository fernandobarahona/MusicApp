extends Control

signal note_displayed(note)
signal after_piano_key_pressed_evaluated(nb_try, nb_try_correct, corrected)

# all notes generated to create the music score
var generated_notes = []

# number of notes to generate
var nb_notes_togenerated = 20

var counter = 2

var current_displayed_index = 0

var last_displayed_index = 0

var last_key_pressed

var free_note

var highlight

var nb_keypiano_pressed = 4

var note_offset = 50

var occupied_note:Array

var actual_displayed_note:Array

#since his start to play this session
var nb_session_keypiano_pressed

var nb_session_keypiano_pressed_corrected

# Called when the node enters the scene tree for the first time.
func _ready():
	nb_session_keypiano_pressed = 0
	nb_session_keypiano_pressed_corrected = 0
#	var p = Note.new(GameManager.Notes.E, GameManager.Octave.oct_5)
#	_display_note(p)
	var ng = NotesGenerator.new()
	generated_notes = ng._generetate_notes(nb_notes_togenerated)
	for i in range(4):
		_display_note(generated_notes[last_displayed_index])
		note_offset += 150
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
#	if generated_notes.size() > current_displayed_index:
#
#		counter -= delta
#
#		if counter <= 0:
#			current_displayed_index+=1
#			counter = 2
#			if generated_notes.size() > current_displayed_index:
#				_display_note(generated_notes[current_displayed_index])
	pass

#this function display visually on the sheet a note
func _display_note(note: Note):
	emit_signal("note_displayed", note)
	highlight = _get_free_note(note)
	occupied_note.append(highlight)
	actual_displayed_note.append(note)
	highlight.visible = true
	highlight.get_node("Highlight")._display(note_offset, note.flated)
	last_displayed_index += 1
	#highlight._resetColor()
#	if note.octave == GameManager.Octave.oct_3:
#		if note.note == GameManager.Notes.A:
#			highlight._display($posA3.position)
#
#		if note.note == GameManager.Notes.B:
#			highlight._display($posB3.position)
#
#
#	if note.octave == GameManager.Octave.oct_4:
#		if note.note == GameManager.Notes.C:
#			highlight._display($posC4.position)
#
#		if note.note == GameManager.Notes.D:
#			highlight._display($posD4.position)
#
#		if note.note == GameManager.Notes.E:
#			highlight._display($posE4.position)
#
#		if note.note == GameManager.Notes.F:
#			highlight._display($posF4.position)
#
#		if note.note == GameManager.Notes.G:
#			highlight._display($posG4.position)
#
#		if note.note == GameManager.Notes.A:
#			highlight._display($posA4.position)
#
#		if note.note == GameManager.Notes.B:
#			highlight._display($posB4.position)
#
#
#	if note.octave == GameManager.Octave.oct_5:
#		if note.note == GameManager.Notes.C:
#			highlight._display($posC5.position)
#
#		if note.note == GameManager.Notes.D:
#			highlight._display($posD5.position)
#
#		if note.note == GameManager.Notes.E:
#			highlight._display($posE5.position)
#
#		if note.note == GameManager.Notes.F:
#			highlight._display($posF5.position)
#
#		if note.note == GameManager.Notes.G:
#			highlight._display($posG5.position)
#
#		if note.note == GameManager.Notes.A:
#			highlight._display($posA5.position)
#
#		if note.note == GameManager.Notes.B:
#			highlight._display($posB5.position)


func _on_Piano_piano_key_pressed(note, btn):
	$Effet.interpolate_property(btn, 'rect_scale', btn.get_scale(), Vector2(1,0.98), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()	
#	if last_key_pressed:
#		last_key_pressed.get_stylebox("normal").bg_color = last_key_pressed.btn_color
#		last_key_pressed.get_stylebox("focus").bg_color = last_key_pressed.btn_color
	
	last_key_pressed = btn
	nb_session_keypiano_pressed +=1
	if actual_displayed_note[current_displayed_index].note == note.note and actual_displayed_note[current_displayed_index].octave == note.octave and actual_displayed_note[current_displayed_index].flated == occupied_note[4-nb_keypiano_pressed].get_node("Highlight").flated:
		occupied_note[4-nb_keypiano_pressed].get_node("Highlight")._changeColor(true)
		nb_session_keypiano_pressed_corrected += 1
	else:
		occupied_note[4-nb_keypiano_pressed].get_node("Highlight")._changeColor(false)
	
	emit_signal("after_piano_key_pressed_evaluated", nb_session_keypiano_pressed, nb_session_keypiano_pressed_corrected, actual_displayed_note[current_displayed_index].note == note.note and actual_displayed_note[current_displayed_index].octave == note.octave)
#	if generated_notes[current_displayed_index].note == note.note and generated_notes[current_displayed_index].octave == note.octave:
#		btn.get_stylebox("normal").bg_color = Color.green
#		btn.get_stylebox("focus").bg_color = Color.green
#	else:
#		btn.get_stylebox("normal").bg_color = Color.red
#		btn.get_stylebox("focus").bg_color = Color.red
	
	print("Press note "+str(note.note))
	print("Press note octave "+str(note.octave))	

		
	nb_keypiano_pressed -=1
	current_displayed_index+=1
	
	if nb_keypiano_pressed <=0:
		note_offset = 50
		nb_keypiano_pressed = 4
		current_displayed_index = 0
		actual_displayed_note.clear()
		for i in range(occupied_note.size()):
			occupied_note[i].get_node("Highlight").free = true
			occupied_note[i].get_node("Highlight")._resetColor()
			occupied_note[i].visible = false
		occupied_note.clear()
		for i in range(4):
			_display_note(generated_notes[last_displayed_index])
			if last_displayed_index >= generated_notes.size():
				last_displayed_index = 0
			note_offset += 150
	
	


func _get_free_note(note):
	
	if note.note == GameManager.Notes.C:
		print("free note c")
		highlight = $SheetBg/partition/C4._get_free_note()

	if note.note == GameManager.Notes.D:
		print("free note d")
		highlight = $SheetBg/partition/D4._get_free_note()

	if note.note == GameManager.Notes.E:
		print("free note e")
		highlight = $SheetBg/partition/E4._get_free_note()

	if note.note == GameManager.Notes.F:
		print("free note f")
		highlight = $SheetBg/partition/F4._get_free_note()
			
	if note.note == GameManager.Notes.G:
		print("free note g")
		highlight = $SheetBg/partition/G4._get_free_note()

	if note.note == GameManager.Notes.A:
		print("free note a")
		highlight = $SheetBg/partition/A4._get_free_note()
			
	if note.note == GameManager.Notes.B:
		print("free note b")
		highlight = $SheetBg/partition/B4._get_free_note()
	
	return highlight
#	if $Highlight1.free:
#		$Highlight1.free = false
#		$Highlight2.free = true
#		return $Highlight1
#
#	if $Highlight2.free:
#		$Highlight2.free = false
#		$Highlight3.free = true
#		return $Highlight2
#
#	if $Highlight3.free:
#		$Highlight3.free = false
#		$Highlight4.free = true
#		return $Highlight3
#
#	if $Highlight4.free:
#		$Highlight4.free = false
#		$Highlight1.free = true		
#		return $Highlight4

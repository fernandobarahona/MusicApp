extends Control

const note_ressource = preload("res://Scenes/Objects/Staff_note.tscn")

signal note_displayed(note)
signal after_piano_key_pressed_evaluated(nb_try, nb_try_correct, corrected)

# all notes generated to create the music score
var generated_notes = []

# number of notes to generate
var nb_notes_togenerated = 20

var counter = 2

var last_displayed_index = 0

var last_key_pressed

var free_note

var highlight

#var note_offset = 50

var actual_displayed_note:Array

var occupied_note:Array

#since his start to play this session
var nb_session_keypiano_pressed

var nb_session_keypiano_pressed_corrected

var spawn_delay = 2

var timer_spawn_delay = 2

var total_note_generated = 0

var current_note_compared = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_note_compared = 0
	nb_session_keypiano_pressed = 0
	nb_session_keypiano_pressed_corrected = 0
#	var p = Note.new(GameManager.Notes.E, GameManager.Octave.oct_5)
#	_display_note(p)
	timer_spawn_delay = spawn_delay
	var ng = NotesGenerator.new()
	generated_notes = ng._generetate_notes(nb_notes_togenerated)
#	for i in range(4):
#		_display_note(generated_notes[last_displayed_index])
		#note_offset += 150
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer_spawn_delay -= delta
	if timer_spawn_delay <= 0:
		_display_note(generated_notes[last_displayed_index])
		timer_spawn_delay = spawn_delay
		
#	if generated_notes.size() > current_displayed_index:
#
#		counter -= delta
#
#		if counter <= 0:
#			current_displayed_index+=1
#			counter = 2
#			if generated_notes.size() > current_displayed_index:
#				_display_note(generated_notes[current_displayed_index])
	

#this function display visually on the sheet a note
func _display_note(note: Note):
	emit_signal("note_displayed", note)
	highlight = _get_free_note(note)
	actual_displayed_note.append(note)
	occupied_note.append(highlight)
	highlight.visible = true
	highlight.get_node("Highlight")._display(note.flated)
	highlight.get_node("Highlight").index = total_note_generated
	total_note_generated += 1
	last_displayed_index += 1
	#highlight._resetColor()
	
	if last_displayed_index >= generated_notes.size():
		last_displayed_index = 0


func _on_Piano_piano_key_pressed(note, btn):
	$Effet.interpolate_property(btn, 'rect_scale', btn.get_scale(), Vector2(1,0.98), 0.3, Tween.TRANS_QUAD, Tween.EASE_OUT)
	$Effet.start()	
#	if last_key_pressed:
#		last_key_pressed.get_stylebox("normal").bg_color = last_key_pressed.btn_color
#		last_key_pressed.get_stylebox("focus").bg_color = last_key_pressed.btn_color
	
	if current_note_compared >= actual_displayed_note.size():
		return
	
	last_key_pressed = btn
	nb_session_keypiano_pressed +=1
	
	if note.flated == actual_displayed_note[current_note_compared].flated and  actual_displayed_note[current_note_compared].note == note.note and actual_displayed_note[current_note_compared].octave == note.octave and actual_displayed_note[current_note_compared].flated == occupied_note[current_note_compared].get_node("Highlight").flated:
		occupied_note[current_note_compared].get_node("Highlight")._changeColor(true)
		nb_session_keypiano_pressed_corrected += 1
	else:
		occupied_note[current_note_compared].get_node("Highlight")._changeColor(false)
	
	emit_signal("after_piano_key_pressed_evaluated", nb_session_keypiano_pressed, nb_session_keypiano_pressed_corrected, actual_displayed_note[current_note_compared].note == note.note and actual_displayed_note[current_note_compared].octave == note.octave)
#	if generated_notes[current_displayed_index].note == note.note and generated_notes[current_displayed_index].octave == note.octave:
#		btn.get_stylebox("normal").bg_color = Color.green
#		btn.get_stylebox("focus").bg_color = Color.green
#	else:
#		btn.get_stylebox("normal").bg_color = Color.red
#		btn.get_stylebox("focus").bg_color = Color.red
	
	print("Press note "+str(note.note))
	print("Press note octave "+str(note.octave))	
	
	current_note_compared += 1


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

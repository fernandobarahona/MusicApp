extends Control

const note_ressource = preload("res://Scenes/Objects/Staff_note.tscn")

signal note_displayed(note)
signal after_piano_key_pressed_evaluated(nb_try, nb_try_correct, corrected)

# all notes generated to create the music score
var generated_notes = []

# number of notes to generate
var nb_notes_togenerated = 20


var last_displayed_index = 0

var last_key_pressed

var highlight

var actual_displayed_note:Array

var actual_displayed_highlight:Array

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

	timer_spawn_delay = spawn_delay
	var ng = NotesGenerator.new()
	generated_notes = ng._generetate_notes(nb_notes_togenerated)

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer_spawn_delay -= delta
	if timer_spawn_delay <= 0:
		_display_note(generated_notes[last_displayed_index])
		timer_spawn_delay = spawn_delay
		
	

#this function display visually on the sheet a note
func _display_note(note: Note):
	emit_signal("note_displayed", note)
	highlight = _instantiate_note(note)
	actual_displayed_note.append(note)
	actual_displayed_highlight.append(highlight)
	highlight.visible = true
	highlight.get_node("Highlight")._display(note.flated)
	highlight.get_node("Highlight").index = total_note_generated
	total_note_generated += 1
	last_displayed_index += 1

	
	if last_displayed_index >= generated_notes.size():
		last_displayed_index = 0


func _on_Piano_piano_key_pressed(note, btn):
	if current_note_compared >= actual_displayed_note.size():
		return
	
	last_key_pressed = btn
	nb_session_keypiano_pressed +=1
	
	if note.flated == actual_displayed_note[current_note_compared].flated and  actual_displayed_note[current_note_compared].note == note.note and actual_displayed_note[current_note_compared].octave == note.octave and actual_displayed_note[current_note_compared].flated == actual_displayed_highlight[current_note_compared].get_node("Highlight").flated:
		actual_displayed_highlight[current_note_compared].get_node("Highlight")._changeColor(true)
		nb_session_keypiano_pressed_corrected += 1
	else:
		actual_displayed_highlight[current_note_compared].get_node("Highlight")._changeColor(false)
	
	emit_signal("after_piano_key_pressed_evaluated", nb_session_keypiano_pressed, nb_session_keypiano_pressed_corrected, actual_displayed_note[current_note_compared].note == note.note and actual_displayed_note[current_note_compared].octave == note.octave)
	
	print("Press note "+str(note.note))
	print("Press note octave "+str(note.octave))	
	
	current_note_compared += 1


func _instantiate_note(note):
	
	if note.note == GameManager.Notes.C:
		print("free note c")
		highlight = $SheetBg/partition/C4._instantiate_note()

	if note.note == GameManager.Notes.D:
		print("free note d")
		highlight = $SheetBg/partition/D4._instantiate_note()

	if note.note == GameManager.Notes.E:
		print("free note e")
		highlight = $SheetBg/partition/E4._instantiate_note()

	if note.note == GameManager.Notes.F:
		print("free note f")
		highlight = $SheetBg/partition/F4._instantiate_note()
			
	if note.note == GameManager.Notes.G:
		print("free note g")
		highlight = $SheetBg/partition/G4._instantiate_note()

	if note.note == GameManager.Notes.A:
		print("free note a")
		highlight = $SheetBg/partition/A4._instantiate_note()
			
	if note.note == GameManager.Notes.B:
		print("free note b")
		highlight = $SheetBg/partition/B4._instantiate_note()
	
	return highlight

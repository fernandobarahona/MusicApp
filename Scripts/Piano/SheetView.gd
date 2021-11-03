extends Control

signal note_displayed(note)

# all notes generated to create the music score
var generated_notes = []

# number of notes to generate
var nb_notes_togenerated = 20

var counter = 2

var current_displayed_index = 0

var last_key_pressed


# Called when the node enters the scene tree for the first time.
func _ready():
	var p = Note.new(GameManager.Notes.E, GameManager.Octave.oct_5)
	_display_note(p)
	var ng = NotesGenerator.new()
	generated_notes = ng._generetate_notes(nb_notes_togenerated)
	_display_note(generated_notes[current_displayed_index])
	

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
	if note.octave == GameManager.Octave.oct_3:
		if note.note == GameManager.Notes.A:
			$Highlight.position = $posA3.position

		if note.note == GameManager.Notes.B:
			$Highlight.position = $posB3.position


	if note.octave == GameManager.Octave.oct_4:
		if note.note == GameManager.Notes.C:
			$Highlight.position = $posC4.position

		if note.note == GameManager.Notes.D:
			$Highlight.position = $posD4.position

		if note.note == GameManager.Notes.E:
			$Highlight.position = $posE4.position

		if note.note == GameManager.Notes.F:
			$Highlight.position = $posF4.position
			
		if note.note == GameManager.Notes.G:
			$Highlight.position = $posG4.position

		if note.note == GameManager.Notes.A:
			$Highlight.position = $posA4.position
			
		if note.note == GameManager.Notes.B:
			$Highlight.position = $posB4.position


	if note.octave == GameManager.Octave.oct_5:
		if note.note == GameManager.Notes.C:
			$Highlight.position = $posC5.position

		if note.note == GameManager.Notes.D:
			$Highlight.position = $posD5.position

		if note.note == GameManager.Notes.E:
			$Highlight.position = $posE5.position

		if note.note == GameManager.Notes.F:
			$Highlight.position = $posF5.position
			
		if note.note == GameManager.Notes.G:
			$Highlight.position = $posG5.position

		if note.note == GameManager.Notes.A:
			$Highlight.position = $posA5.position
			
		if note.note == GameManager.Notes.B:
			$Highlight.position = $posB5.position


func _on_Piano_piano_key_pressed(note, btn):
	
#	if last_key_pressed:
#		last_key_pressed.get_stylebox("normal").bg_color = last_key_pressed.btn_color
#		last_key_pressed.get_stylebox("focus").bg_color = last_key_pressed.btn_color
	
	last_key_pressed = btn
	
#	if generated_notes[current_displayed_index].note == note.note and generated_notes[current_displayed_index].octave == note.octave:
#		btn.get_stylebox("normal").bg_color = Color.green
#		btn.get_stylebox("focus").bg_color = Color.green
#	else:
#		btn.get_stylebox("normal").bg_color = Color.red
#		btn.get_stylebox("focus").bg_color = Color.red
	
	print("Press note "+str(note.note))
	print("Press note octave "+str(note.octave))	
	current_displayed_index+=1
	if current_displayed_index >= generated_notes.size():
		current_displayed_index = 0
	_display_note(generated_notes[current_displayed_index])

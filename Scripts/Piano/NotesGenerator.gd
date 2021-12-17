extends Node

class_name NotesGenerator

#list of generated notes
var generated_notes = []

var tempo = 2000

#var possibleNotes = [Note.new(GameManager.Notes.A, 3), Note.new(GameManager.Notes.B, 3), Note.new(GameManager.Notes.C, 4), Note.new(GameManager.Notes.D, 4), Note.new(GameManager.Notes.E, 4), Note.new(GameManager.Notes.F, 4), Note.new(GameManager.Notes.G, 4), Note.new(GameManager.Notes.A, 4), Note.new(GameManager.Notes.B, 4), Note.new(GameManager.Notes.C, 5), Note.new(GameManager.Notes.D, 5), Note.new(GameManager.Notes.E, 5), Note.new(GameManager.Notes.F, 5), Note.new(GameManager.Notes.G, 5), Note.new(GameManager.Notes.A, 5), Note.new(GameManager.Notes.B, 5)]
#var possibleNotes = [Note.new(GameManager.Notes.C, 4), Note.new(GameManager.Notes.D, 4), Note.new(GameManager.Notes.E, 4), Note.new(GameManager.Notes.F, 4), Note.new(GameManager.Notes.G, 4), Note.new(GameManager.Notes.A, 4), Note.new(GameManager.Notes.B, 4)]
var possibleNotes = [Note.new(GameManager.Notes.D, 4, true),Note.new(GameManager.Notes.E, 4, true),Note.new(GameManager.Notes.G, 4, true),Note.new(GameManager.Notes.A, 4, true),Note.new(GameManager.Notes.B, 4, true),Note.new(GameManager.Notes.C, 4), Note.new(GameManager.Notes.D, 4), Note.new(GameManager.Notes.E, 4), Note.new(GameManager.Notes.F, 4), Note.new(GameManager.Notes.G, 4), Note.new(GameManager.Notes.A, 4), Note.new(GameManager.Notes.B, 4)]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# this function generate list of notes
func _generetate_notes(nbNote:int):
	randomize()
	for i in range(nbNote):
		 generated_notes.append(possibleNotes[randi()%possibleNotes.size()])
	
	for elt in generated_notes:
		print("==============")
		print("Note: "+str(elt.note))
		print("Octave: "+str(elt.octave))
		print("==============")
	
	return generated_notes

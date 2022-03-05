extends Control


signal piano_key_pressed(note, btn)

export(GameManager.Octave) var octave = GameManager.Octave.oct_4


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_Sheet_note_displayed(note):
	octave = note.octave

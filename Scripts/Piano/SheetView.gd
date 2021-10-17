extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var p = Note.new()
	p.note = GameManager.Notes.E
	p.octave = GameManager.Octave.oct_5
	_display_note(p)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _display_note(note: Note):
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

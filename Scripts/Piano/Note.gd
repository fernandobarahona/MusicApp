extends Node

class_name Note

var note

var octave

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _init(note, octave):
	self.note = note
	self.octave = octave

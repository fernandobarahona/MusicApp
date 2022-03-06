extends Node

class_name Note

var note

var octave

var flated

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _init(note, octave, is_flated = false):
	self.note = note
	self.octave = octave
	self.flated = is_flated
	

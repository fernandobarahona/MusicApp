extends Path2D

export(Array, NodePath) var highlights
var highlight_note

# Called when the node enters the scene tree for the first time.
func _ready():
	_disabled_notes()
	#pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _disabled_notes():
	for i in range(highlights.size()):
		get_node(highlights[i]).offset = 800
		get_node(highlights[i]).visible = false


func _instantiate_note():
	highlight_note = get_tree().root.get_node("./GameScene/Sheet").note_ressource.instance()

	self.add_child(highlight_note)
	highlights.append(highlight_note)
	return highlight_note



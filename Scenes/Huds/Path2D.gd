extends Path2D

export(Array, NodePath) var highlights

var free:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	#$PathFollow2D.offset = 50
	_disabled_notes()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$PathFollow2D.offset -= 50 * delta
	pass

func _display(offset:float):
	$PathFollow2D.offset += offset

func _changeColor(rigth:bool):
	highlights._changeColor(rigth)

func _resetColor():
	$PathFollow2D.offset = 50
	highlights._resetColor()


func _disabled_notes():
	for i in range(highlights.size()):
		get_node(highlights[i]).offset = 50
		get_node(highlights[i]).visible = false


func _get_free_note():
	print("pass here1")
	for i in range(highlights.size()):
		print("pass here2")
		if get_node(highlights[i]).get_node("Highlight").free:
			get_node(highlights[i]).get_node("Highlight").free = false
			print("pass here3 "+name+""+get_node(highlights[i]).name)
			return get_node(highlights[i])


extends Sprite


export(Texture) var redTexture

export(Texture) var greenTexture

export(Texture) var normalTexture

export(Texture) var flatRedTexture

export(Texture) var flatGreenTexture

export(Texture) var flatNormalTexture

var speed_note = 70

var flated:bool = false

var index:int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent() is PathFollow2D:
		get_parent().offset -= speed_note*delta
	
		if get_parent().offset <= 0:
			if index >= 0:
				get_tree().root.get_node("./GameScene/Sheet").current_note_compared += 1
			get_parent().queue_free()
	

func _display(flated_note:bool):
	flated = flated_note
	if flated:
		texture = flatNormalTexture
	else:
		texture = normalTexture

func _changeColor(rigth:bool):
	if rigth:
		if flated:
			texture = flatGreenTexture
		else:
			texture = greenTexture
	else:
		if flated:
			texture = flatRedTexture
		else:
			texture = redTexture

func _resetColor():
	texture = normalTexture
	flated = false

extends Sprite


export(Texture) var redTexture

export(Texture) var greenTexture

export(Texture) var normalTexture

export(Texture) var flatRedTexture

export(Texture) var flatGreenTexture

export(Texture) var flatNormalTexture

var free:bool = true
var flated:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _display(offset:float, flated_note:bool):
	get_parent().offset = offset
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

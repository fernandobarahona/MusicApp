extends Sprite


export(Texture) var redTexture

export(Texture) var greenTexture

export(Texture) var normalTexture

var free:bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _display(offset:float):
	get_parent().offset = offset

func _changeColor(rigth:bool):
	if rigth:
		texture = greenTexture
	else:
		texture = redTexture

func _resetColor():
	texture = normalTexture

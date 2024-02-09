extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if typeof(GV.piece_array[GV.posx*8+GV.posy]) == typeof(0) and GV.created_locker.is_active == false:
		$".".visible = true
	else:
		$".".visible = false
	pass

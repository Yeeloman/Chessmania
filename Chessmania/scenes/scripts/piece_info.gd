extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if typeof(GV.piece_array[GV.posx*8+GV.posy]) == typeof(0) and GV.created_locker.is_active == false:
		$".".visible = false
	elif GV.created_locker.is_active == true and typeof(GV.piece_array[GV.posx*8+GV.posy]) != typeof(0):
		#display the hp of the hovered piece test
		if GV.piece_active != GV.hovered_piece:
			$TabContainer/HP/target_HP_bar.visible = true
			$TabContainer/HP/target_HP_bar.max_value = GV.hovered_piece.HP
	else:
		$".".visible = true
		#display the hp of the focused piece
		$TabContainer/HP/selected_p.text = GV.hovered_piece.display_name
		$TabContainer/HP/HP_bar.max_value = GV.hovered_piece.HP

		$TabContainer/HP/target_HP_bar.visible = false
	pass

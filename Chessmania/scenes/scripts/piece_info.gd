extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if typeof(GV.piece_array[GV.posx*8+GV.posy]) == typeof(0) and GV.created_locker.is_active == false:
		visible = false
	elif GV.created_locker.is_active == true and typeof(GV.piece_array[GV.posx*8+GV.posy]) != typeof(0):
		#display the hp of the hovered piece
		if GV.piece_active != GV.hovered_piece:
			if GV.hovered_piece:
				%target_HP_bar.visible = true
				%target_HP_bar.max_value = GV.hovered_piece.HP
				%target_HP_bar.value = GV.hovered_piece.cur_hp

	else:
		$".".visible = true
		#display the hp of the focused piece
		if GV.hovered_piece:
			%selected_p.text = GV.hovered_piece.display_name
			if GV.hovered_piece in GV.played_pieces_array:
				%selected_p.text += ' - moved'
			%HP_bar.max_value = GV.hovered_piece.HP
			%HP_bar.value = GV.hovered_piece.cur_hp
			%target_HP_bar.visible = false
	pass

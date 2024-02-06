extends Node


func _match_show_move(arg):
	match arg : 
		"w_pawn", "b_pawn":
			_show_pawn_move(arg)
		"w_king", "b_king":
			_show_king_move(arg)
		"w_queen", "b_queen":
			_show_queen_move(arg)
		"w_rook", "b_rook":
			_show_rook_move(arg)
		"w_knight", "b_knight":
			_show_knight_move(arg)
		"w_bishop", "b_bishop":
			_show_bishop_move(arg)
		_ :
			pass



func _show_pawn_move(arg):
	if GV.created_locker.is_active == false :
		if arg == "w_pawn" :
			if GV.posx != 1:
				if typeof(GV.piece_array[((GV.posx+1)*8)+GV.posy])==typeof(0):
					var move = GV.grid_square_id[((GV.posx+1)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
			else:
				if typeof(GV.piece_array[((GV.posx+1)*8)+GV.posy])==typeof(0) and typeof(GV.piece_array[((GV.posx+2)*8)+GV.posy])==typeof(0):
					var move = GV.grid_square_id[((GV.posx+1)*8)+GV.posy]
					var move_two = GV.grid_square_id[((GV.posx+2)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					move_two.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
					GV.colored_array.push_back(move_two)
				elif typeof(GV.piece_array[((GV.posx+1)*8)+GV.posy])==typeof(0) and !(typeof(GV.piece_array[((GV.posx+2)*8)+GV.posy])==typeof(0)) :
					var move = GV.grid_square_id[((GV.posx+1)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
				else : 
					pass
		if arg == "b_pawn":
			if GV.posx != 8:
				var move = GV.grid_square_id[((GV.posx-1)*8)+GV.posy]
				move.get_node("mov").color = GV.move_color
				await get_tree().create_timer(0.1).timeout
				GV.colored_array.push_back(move)
			else:
				var move = GV.grid_square_id[((GV.posx-1)*8)+GV.posy]
				var move_two = GV.grid_square_id[((GV.posx-2)*8)+GV.posy]
				move.get_node("mov").color = GV.move_color
				move_two.get_node("mov").color = GV.move_color
				await get_tree().create_timer(0.1).timeout
				GV.colored_array.push_back(move)
				GV.colored_array.push_back(move_two)
	pass

func _show_king_move(arg):
	print("king")
	pass

func _show_queen_move(arg):
	print("queen")
	pass

func _show_knight_move(arg):
	print("knight")
	pass

func _show_rook_move(arg):
	print("rook")
	pass

func _show_bishop_move(arg):
	print("bishop")
	pass









func _move_pawn():
	pass
func _move_rook():
	pass

func _move_knight():
	pass

func _move_bishop():
	pass

func _move_king():
	pass

func _move_queen():
	pass

func _ready():
	pass

func _process(_delta):
	pass

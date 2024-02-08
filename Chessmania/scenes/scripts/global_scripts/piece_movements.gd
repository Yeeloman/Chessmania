extends Node



func _match_show_move(arg):
	match arg: 
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


#func _show_pawn_move(arg):
	#var forward_direction = 0
	#var backward_direction = 0
	#var piece_to_check = ""
	#if arg == "w_pawn":
		#piece_to_check = "w_pawn"
		#forward_direction = 1
		#backward_direction = -1
	#else: 
		#piece_to_check = "b_pawn"
		#forward_direction = -1
		#backward_direction = 1
#
	#if GV.created_locker.is_active == false:
		#if GV.posx != 1 and GV.posx != 8:
			#_check_pawn_move(forward_direction)
			#_check_pawn_move(forward_direction * 2, true)
		#else:
			#_check_pawn_move(forward_direction)
		#
#func _check_pawn_move(direction, is_double_move = false):
	#var target_posx = GV.posx + direction
	#if typeof(GV.piece_array[(target_posx * 8) + GV.posy]) == typeof(0):
		#var move = GV.grid_square_id[(target_posx * 8) + GV.posy]
		#move.get_node("mov").color = GV.move_color
		#await get_tree().create_timer(0.1).timeout
		#GV.colored_array.push_back(move)
		#if is_double_move:
			#var second_target_posx = GV.posx + direction * 2
			#var move_two = GV.grid_square_id[(second_target_posx * 8) + GV.posy]
			#move_two.get_node("mov").color = GV.move_color
			#await get_tree().create_timer(0.1).timeout
			#GV.colored_array.push_back(move_two)

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
				if typeof(GV.piece_array[((GV.posx-1)*8)+GV.posy])==typeof(0):
					var move = GV.grid_square_id[((GV.posx-1)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
			else:
				if typeof(GV.piece_array[((GV.posx-1)*8)+GV.posy])==typeof(0) and typeof(GV.piece_array[((GV.posx-2)*8)+GV.posy])==typeof(0):
					var move = GV.grid_square_id[((GV.posx-1)*8)+GV.posy]
					var move_two = GV.grid_square_id[((GV.posx-2)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					move_two.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
					GV.colored_array.push_back(move_two)
				elif typeof(GV.piece_array[((GV.posx-1)*8)+GV.posy])==typeof(0) and !(typeof(GV.piece_array[((GV.posx-2)*8)+GV.posy])==typeof(0)) :
					var move = GV.grid_square_id[((GV.posx-1)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
				else :
					pass


func _show_king_move(arg):
	print('king')
	if GV.created_locker.is_active == false :
		if arg == "w_king":
			pass
		else :
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


# moves the target piece
func _on_piece_move():
	if GV.created_locker.is_active == true : 
		if Input.is_action_just_pressed("move") :
			for el in GV.colored_array:
				if el.global_position == GV.created_locker.global_position:
					GV.piece_active.global_position = GV.created_locker.global_position
					GV.piece_array[(GV.prev_posx*8)+GV.prev_posy] = 0
					GV.piece_array[(GV.posx*8)+GV.posy] = GV.piece_active
					_mini_hide_move() # to hide move after the piece is moved
	pass


# hide the piece movement after moving the piece
func _mini_hide_move():
	for i in range(GV.colored_array.size()):
		GV.colored_array[i].get_node("mov").color = GV.transparent
	GV.colored_array.clear()


# undo the coloring move changes
func _on_hide_move():
	if GV.created_locker.is_active == false:
		for i in range(GV.colored_array.size()):
			GV.colored_array[i].get_node("mov").color = GV.transparent
		GV.colored_array.clear()

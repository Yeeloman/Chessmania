extends Node


var dark_square = Color("#36454F")
var light_square = Color("#D3D3D3")
var move_color = Color("#3EA3AC90")
var attack_color = Color("#AC473E90")
var transparent = Color("#fa6ca000")
var active_color_locker = Color("#0000FF90")
var passive_color_locker = Color("#00FFAF90")

func _match_show_move(grid_array, arg, piece_array, posx, posy, locker, colored_array):
	match arg : 
		"w_pawn", "b_pawn":
			_show_pawn_move(grid_array, arg, piece_array, posx, posy, locker, colored_array)
		"w_king", "b_king":
			_show_king_move(grid_array, arg, piece_array, posx, posy, locker, colored_array)
		"w_queen", "b_queen":
			_show_queen_move(grid_array, arg, piece_array, posx, posy, locker, colored_array)
		"w_rook", "b_rook":
			_show_rook_move(grid_array, arg, piece_array, posx, posy, locker, colored_array)
		"w_knight", "b_knight":
			_show_knight_move(grid_array, arg, piece_array, posx, posy, locker, colored_array)
		"w_bishop", "b_bishop":
			_show_bishop_move(grid_array, arg, piece_array, posx, posy, locker, colored_array)
		_ :
			pass



func _show_pawn_move(grid_array, arg, piece_array, posx, posy, locker, colored_array):
	if locker.is_active == false :
		if arg == "w_pawn" :
			if posx != 1:
				if typeof(piece_array[((posx+1)*8)+posy])==typeof(0):
					var move = grid_array[((posx+1)*8)+posy]
					move.get_node("mov").color = move_color
					await get_tree().create_timer(0.1).timeout
					colored_array.push_back(move)
			else:
				if typeof(piece_array[((posx+1)*8)+posy])==typeof(0) and typeof(piece_array[((posx+2)*8)+posy])==typeof(0):
					var move = grid_array[((posx+1)*8)+posy]
					var move_two = grid_array[((posx+2)*8)+posy]
					move.get_node("mov").color = move_color
					move_two.get_node("mov").color = move_color
					await get_tree().create_timer(0.1).timeout
					colored_array.push_back(move)
					colored_array.push_back(move_two)
				elif typeof(piece_array[((posx+1)*8)+posy])==typeof(0) and !(typeof(piece_array[((posx+2)*8)+posy])==typeof(0)) :
					var move = grid_array[((posx+1)*8)+posy]
					move.get_node("mov").color = move_color
					await get_tree().create_timer(0.1).timeout
					colored_array.push_back(move)
				else : 
					pass
		if arg == "b_pawn":
			if posx != 8:
				var move = grid_array[((posx-1)*8)+posy]
				move.get_node("mov").color = move_color
				await get_tree().create_timer(0.1).timeout
				colored_array.push_back(move)
			else:
				var move = grid_array[((posx-1)*8)+posy]
				var move_two = grid_array[((posx-2)*8)+posy]
				move.get_node("mov").color = move_color
				move_two.get_node("mov").color = move_color
				await get_tree().create_timer(0.1).timeout
				colored_array.push_back(move)
				colored_array.push_back(move_two)
	pass

func _show_king_move(grid_array, arg, piece_array, posx, posy, locker, colored_array):
	print("king")
	pass

func _show_queen_move(grid_array, arg, piece_array, posx, posy, locker, colored_array):
	print("queen")
	pass

func _show_knight_move(grid_array, arg, piece_array, posx, posy, locker, colored_array):
	print("knight")
	pass

func _show_rook_move(grid_array, arg, piece_array, posx, posy, locker, colored_array):
	print("rook")
	pass

func _show_bishop_move(grid_array, arg, piece_array, posx, posy, locker, colored_array):
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

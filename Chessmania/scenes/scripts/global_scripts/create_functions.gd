extends Node

@onready var locker = preload("res://scenes/locker.tscn")
@onready var square = preload("res://scenes/square.tscn")
@onready var piece_info = preload("res://scenes/piece_info.tscn")
@onready var player_info = preload("res://scenes/player_info.tscn")
@onready var action_menu_packed = preload("res://scenes/action_menu.tscn")


# creates the locker instance
func _create_locker(chess_board):
	var new_locker = locker.instantiate()
	chess_board.add_child(new_locker)
	new_locker.global_position = GV.piece_array[3].global_position
	new_locker.get_node("locker_rect").color = GV.passive_color_locker
	return new_locker


# instantiate each piece then add it as a child to the chess board
func _create_piece(chess_board, piece, location) -> void:
	var new_piece_packed = piece.p_scene
	var new_piece = new_piece_packed.instantiate()
	new_piece.display_name = piece.display_name
	new_piece.p_type = piece.p_type
	new_piece.p_name = piece.p_name
	new_piece.p_pos = piece.p_pos
	chess_board.add_child(new_piece)
	new_piece.global_position = GV.grid_square_id[location].global_position
	GV.piece_array[location] = new_piece
	new_piece.p_id = location
	_set_stats(piece, new_piece)


# function that sets the stats for the pieces
func _set_stats(p_prototype, p_target) -> void:
	p_target.HP = p_prototype.HP
	p_target.Atk = p_prototype.Atk
	p_target.Def = p_prototype.Def
	p_target.Spd = p_prototype.Spd
	p_target.Lck = p_prototype.Lck
	pass


# function that creates instances of the square scene
func _create_square(grid):
	var created_square = square.instantiate()
	created_square.square_id = GV.grid_square_id.size()
	grid.add_child(created_square)
	GV.grid_square_id.push_back(created_square)


# function that creates the displayer of piece informations
func _create_info_displayer(p_info_container):
	GV.created_displayer = piece_info.instantiate()
	p_info_container.add_child(GV.created_displayer)
	pass

# function that creates player info
func _create_player_displayer(player_info_container):
	GV.created_player = player_info.instantiate()
	player_info_container.add_child(GV.created_player)
	GV.created_player.visible = false
	pass

#function that creates action menu
func _create_action_menu(container):
	GV.created_menu = action_menu_packed.instantiate()
	container.add_child(GV.created_menu)
	#GV.created_menu.visible = false
	pass

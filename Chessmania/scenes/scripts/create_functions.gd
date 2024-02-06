extends Node

@onready var locker = preload("res://scenes/locker.tscn")
@onready var square = preload("res://scenes/square.tscn")


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
	new_piece.p_type = piece.p_type
	new_piece.p_name = piece.p_name
	chess_board.add_child(new_piece)
	new_piece.global_position = GV.grid_square_id[location].global_position
	GV.piece_array[location] = new_piece
	new_piece.p_id = location


# function that creates instances of the square scene
func _create_square(grid):
	var created_square = square.instantiate()
	created_square.square_id = GV.grid_square_id.size()
	grid.add_child(created_square)
	GV.grid_square_id.push_back(created_square)

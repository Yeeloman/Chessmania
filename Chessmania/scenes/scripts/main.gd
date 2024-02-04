extends Control

@onready var grid = $chess_board/chess_grid
@onready var chess_board = $chess_board

@onready var square = preload("res://scenes/square.tscn")

var dark_square = Color("#36454F")
var light_square = Color("#D3D3D3")
var starting_pos = "rnbqkbnr/pppppppp/8/8/8/8/8/8/PPPPPPPP/RNBQKBNR"
var grid_square_id := []
var piece_array := []

func _ready():
	for i in range(80):
		_create_square()
	await get_tree().create_timer(0.1).timeout
	squares_coloring()
	piece_array.resize(80)
	piece_array.fill(0)
	_position_starter(starting_pos)

func _process(_delta):
	pass

# function that colors the squares
func squares_coloring() -> void:
	var color_bit = 0
	for i in range(10):
		for j in range(8):
			if j % 2 == color_bit:
				grid_square_id[i*8+j]._set_bg(dark_square)
			else: grid_square_id[i*8+j]._set_bg(light_square)
		if color_bit == 0:
			color_bit = 1
		else: color_bit = 0

# function that creates instances of the square scene
# then add them as children to the grid
func _create_square():
	var created_square = square.instantiate()
	created_square.square_id = grid_square_id.size()
	grid.add_child(created_square)
	grid_square_id.push_back(created_square)

# instantiate the pieces to their starting positions
func _position_starter(starting_pos: String) -> void:
	var board_idx := 0
	for i in starting_pos:
		if i == "/":continue
		if i.is_valid_int():
			board_idx += i.to_int()
		else:
			_create_piece(DatAhandler.pieces_dic[i], board_idx)
			board_idx += 1

# instantiate each piece then add it as a child to the chess board
func _create_piece(piece, location) -> void:
	var new_piece_packed = piece.p_scene
	var new_piece = new_piece_packed.instantiate()
	new_piece.p_type = piece.p_type
	chess_board.add_child(new_piece)
	new_piece.global_position = grid_square_id[location].global_position
	piece_array[location] = new_piece
	new_piece.p_id = location

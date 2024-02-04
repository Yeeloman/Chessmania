extends Control

@onready var grid = $chess_board/chess_grid
@onready var chess_board = $chess_board

@onready var square = preload("res://scenes/square.tscn")

var dark_square = Color("#36454F")
var light_square = Color("#D3D3D3")
var starting_pos = "rnbqkbnr/pppppppp/8/8/8/8/8/8/PPPPPPPP/RNBQKBNR"
var grid_square_id := []

func _ready():
	for i in range(80):
		_create_square()
	await get_tree().create_timer(0.1).timeout
	squares_coloring()
	_position_starter(starting_pos)
	#for i in range(1, 2):
		#for j in range(8):
			#_create_pawn(i, j)
			#pass

func _process(_delta):
	pass

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


func _create_square():
	var created_square = square.instantiate()
	created_square.square_id = grid_square_id.size()
	grid.add_child(created_square)
	grid_square_id.push_back(created_square)

func _position_starter(starting_pos: String) -> void:
	var board_idx := 0
	for i in starting_pos:
		if i == "/":continue
		if i.is_valid_int():
			board_idx += i.to_int()
		else:
			_create_piece(DatAhandler.pieces_dic[i], board_idx)
			board_idx += 1


func _create_piece(piece, location) -> void:
	var new_piece_packed = piece.p_scene
	var new_piece = new_piece_packed.instantiate()
	new_piece.p_type = piece.p_type
	chess_board.add_child(new_piece)
	new_piece.global_position = grid_square_id[location].global_position
	pass


#func _create_pawn(row, col):
	#var pawn = dark_pawn.instantiate()
	#chess_board.add_child(pawn)
	#pawn.global_position = grid_square_id[row * 8 + col].global_position


func _on_button_pressed():
	_position_starter(starting_pos)
	pass # Replace with function body.

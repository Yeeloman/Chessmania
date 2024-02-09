extends Control

@onready var grid = $chess_container/chess_board/chess_grid
@onready var chess_board = $chess_container/chess_board
@onready var p_info_container = $piece_info_displayer


func _ready():
	for i in range(80):
		CreateFunc._create_square(grid)
	await get_tree().create_timer(0.1).timeout
	squares_coloring()
	GV.piece_array.resize(80)
	GV.piece_array.fill(0)
	_position_starter(GV.starting_pos)
	GV.created_locker = CreateFunc._create_locker(chess_board)
	GV.prevpos = GV.created_locker.global_position
	CreateFunc._create_info_displayer(p_info_container)
	signal_caller()


func _process(_delta):
	await get_tree().create_timer(0.1).timeout
	HLocker._handle_locker_mov()
	PieceMovements._on_piece_move()


# calls the signals from the ready function
func signal_caller():
	Signals.connect('locker_exited', PieceMovements._on_hide_move)
	Signals.connect('locker_entered', PieceMovements._match_show_move)

	Signals.connect('locker_active', HLocker._on_locker_active)
	Signals.connect('locker_passive', HLocker._on_locker_passive)

# function that colors the squares
func squares_coloring() -> void:
	var color_bit = 0
	for i in range(10):
		for j in range(8):
			if j % 2 == color_bit:
				GV.grid_square_id[i*8+j]._set_bg(GV.dark_square)
			else: GV.grid_square_id[i*8+j]._set_bg(GV.light_square)
		if color_bit == 0:
			color_bit = 1
		else: color_bit = 0


# instantiate the pieces to their starting positions
func _position_starter(starting_pos: String) -> void:
	var board_idx := 0
	for i in starting_pos:
		if i == "/":continue
		if i.is_valid_int():
			board_idx += i.to_int()
		else:
			CreateFunc._create_piece(chess_board, DatAhandler.pieces_dic[i], board_idx)
			board_idx += 1

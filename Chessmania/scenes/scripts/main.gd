extends Control

@onready var grid = $chess_board/chess_grid
@onready var chess_board = $chess_board
@onready var locker = preload("res://scenes/locker.tscn")
@onready var square = preload("res://scenes/square.tscn")

var posx = 0
var posy = 4
var prevpos 

var dark_square = Color("#36454F")
var light_square = Color("#D3D3D3")
var move_color = Color("#ff4444")
var transparent = Color("#fa6ca000")
var starting_pos = "rnbqkbnr/pppppppp/8/8/8/8/8/8/PPPPPPPP/RNBQKBNR"
var grid_square_id := []
var piece_array := []
var colored_array := []
var created_locker

func _ready():
	for i in range(80):
		_create_square()
	await get_tree().create_timer(0.1).timeout
	squares_coloring()
	piece_array.resize(80)
	piece_array.fill(0)
	_position_starter(starting_pos)
	created_locker = _create_locker()
	prevpos = created_locker.global_position
	signal_coller()
	

func signal_coller():
	Signals.connect('locker_entered', _on_show_move)
	Signals.connect('locker_exited', _on_hide_move)

func _on_show_move(arg):
	if arg == "w_pawn" or arg == "b_pawn":
		_pawn_move(arg)
func _on_hide_move():
	for i in range(colored_array.size()):
		colored_array[i].get_node("mov").color = transparent
	colored_array.clear()
	#for i in range(len(colored_array)):
		#print(i)
	#print(colored_array)


func _process(_delta):
	await get_tree().create_timer(0.1).timeout
	if Input.is_action_just_pressed("down"):
		if ((posx+1)*8)+posy < 80 and ((posx+1)*8)+posy>=0 :
			created_locker.global_position = grid_square_id[((posx+1)*8)+posy].global_position
			posx += 1

	if Input.is_action_just_pressed("up"):
		if ((posx-1)*8)+posy < 80 and ((posx-1)*8)+posy>=0 :
			created_locker.global_position = grid_square_id[((posx-1)*8)+posy].global_position
			posx -= 1
		
	if Input.is_action_just_pressed("right"):
		if (posx*8)+posy+1 < 80 and (posx*8)+posy+1>=0 :
			created_locker.global_position = grid_square_id[(posx*8)+posy+1].global_position
			posy += 1
		
	if Input.is_action_just_pressed("left"):
		if (posx*8)+posy-1 < 80 and (posx*8)+posy-1>=0 :
			created_locker.global_position = grid_square_id[(posx*8)+posy-1].global_position
			posy -= 1
		
	
	#for el in piece_array:
		#if typeof(el) != typeof(0) :
			#if el.global_position == created_locker.global_position:
				#_show_move(el.p_name)
					
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
	new_piece.p_name = piece.p_name
	chess_board.add_child(new_piece)
	new_piece.global_position = grid_square_id[location].global_position
	piece_array[location] = new_piece
	new_piece.p_id = location

func _create_locker():
	var new_locker = locker.instantiate()
	chess_board.add_child(new_locker)
	new_locker.global_position = piece_array[4].global_position
	return new_locker

func _pawn_move(name):
	if name == "w_pawn" :
		var move = grid_square_id[((posx+1)*8)+posy]
		var move_two = grid_square_id[((posx+2)*8)+posy]
		move.get_node("mov").color = move_color
		move_two.get_node("mov").color = move_color
		await get_tree().create_timer(0.1).timeout
		colored_array.push_back(move)
		colored_array.push_back(move_two)
	if name == "b_pawn":
		var move = grid_square_id[((posx-1)*8)+posy]
		var move_two = grid_square_id[((posx-2)*8)+posy]
		move.get_node("mov").color = move_color
		move_two.get_node("mov").color = move_color
		await get_tree().create_timer(0.1).timeout
		colored_array.push_back(move)
		colored_array.push_back(move_two)
	pass

#func _pawn_attack()




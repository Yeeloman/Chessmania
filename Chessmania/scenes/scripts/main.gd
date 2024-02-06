extends Control

@onready var grid = $chess_board/chess_grid
@onready var chess_board = $chess_board
@onready var locker = preload("res://scenes/locker.tscn")
@onready var square = preload("res://scenes/square.tscn")


func _ready():
	for i in range(80):
		_create_square()
	await get_tree().create_timer(0.1).timeout
	squares_coloring()
	GV.piece_array.resize(80)
	GV.piece_array.fill(0)
	_position_starter(GV.starting_pos)
	GV.created_locker = _create_locker()
	GV.prevpos = GV.created_locker.global_position
	signal_caller()


func _process(_delta):
	await get_tree().create_timer(0.1).timeout
	_handle_locker_mov()
	_on_pawn_move()


# calls the signals from the ready function
func signal_caller():
	Signals.connect('locker_entered', _on_show_move)
	Signals.connect('locker_exited', _on_hide_move)
	Signals.connect('locker_active', _on_locker_active)
	Signals.connect('locker_passive', _on_locker_passive)


# handles the state where the locker is active
func _on_locker_active():
	print("locker is active")
	Signals.disconnect('locker_active',_on_locker_active)
	Signals.connect('locker_passive', _on_locker_passive)
	for el in GV.piece_array :
		if typeof(el) != typeof(0) :
			if el.global_position == GV.created_locker.global_position : 
				GV.piece_active = el
				GV.prev_posx = GV.posx
				GV.prev_posy = GV.posy


# handle the state where the locker is passive
func _on_locker_passive():
	print("locker is passive")
	Signals.disconnect('locker_passive',_on_locker_passive)
	Signals.connect('locker_active', _on_locker_active)


# calls the function that show the moves
func _on_show_move(arg):
	PieceMovements._match_show_move(arg)


# undo the coloring move changes
func _on_hide_move():
	if GV.created_locker.is_active == false:
		for i in range(GV.colored_array.size()):
			GV.colored_array[i].get_node("mov").color = GV.transparent
		GV.colored_array.clear()


var down_pressed = false
var up_pressed = false
var right_pressed = false
var left_pressed = false

# handles the locker instance movement
func _handle_locker_mov():
	if Input.is_action_just_pressed("down") and not down_pressed:
		down_pressed = true
		if ((GV.posx+1)*8)+GV.posy < 80 and ((GV.posx+1)*8)+GV.posy>=0 :
			GV.created_locker.global_position = GV.grid_square_id[((GV.posx+1)*8)+GV.posy].global_position
			GV.posx += 1
	elif not Input.is_action_pressed("down"):
		down_pressed = false

	if Input.is_action_just_pressed("up") and not up_pressed:
		up_pressed = true
		if ((GV.posx-1)*8)+GV.posy < 80 and ((GV.posx-1)*8)+GV.posy>=0 :
			GV.created_locker.global_position = GV.grid_square_id[((GV.posx-1)*8)+GV.posy].global_position
			GV.posx -= 1
	elif not Input.is_action_pressed("up"):
		up_pressed = false

	if Input.is_action_just_pressed("right") and not right_pressed:
		right_pressed = true
		if (GV.posx*8)+GV.posy+1 < 80 and (GV.posx*8)+GV.posy+1>=0 :
			GV.created_locker.global_position = GV.grid_square_id[(GV.posx*8)+GV.posy+1].global_position
			GV.posy += 1
	elif Input.is_action_pressed("right"):
		right_pressed = false

	if Input.is_action_just_pressed("left") and not left_pressed:
		left_pressed = true
		if (GV.posx*8)+GV.posy-1 < 80 and (GV.posx*8)+GV.posy-1>=0 :
			GV.created_locker.global_position = GV.grid_square_id[(GV.posx*8)+GV.posy-1].global_position
			GV.posy -= 1
	elif Input.is_action_pressed("left"):
		left_pressed = false


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


# function that creates instances of the square scene
func _create_square():
	var created_square = square.instantiate()
	created_square.square_id = GV.grid_square_id.size()
	grid.add_child(created_square)
	GV.grid_square_id.push_back(created_square)


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
	new_piece.global_position = GV.grid_square_id[location].global_position
	GV.piece_array[location] = new_piece
	new_piece.p_id = location


# creates the locker instance
func _create_locker():
	var new_locker = locker.instantiate()
	chess_board.add_child(new_locker)
	new_locker.global_position = GV.piece_array[3].global_position
	new_locker.get_node("locker_rect").color = GV.passive_color_locker
	return new_locker


# moves the target piece
func _on_pawn_move():
	if GV.created_locker.is_active == true : 
		if Input.is_action_just_pressed("move") :
			for el in GV.colored_array:
				if el.global_position == GV.created_locker.global_position:
					GV.piece_active.global_position = GV.created_locker.global_position
					GV.piece_array[(GV.prev_posx*8)+GV.prev_posy] = 0
					GV.piece_array[(GV.posx*8)+GV.posy] = GV.piece_active
					_mini_hide_move()
	pass


# hide the piece movement after moving the piece
func _mini_hide_move():
	for i in range(GV.colored_array.size()):
		GV.colored_array[i].get_node("mov").color = GV.transparent
	GV.colored_array.clear()

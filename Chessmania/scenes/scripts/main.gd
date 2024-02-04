extends Control

@onready var square = preload("res://scenes/square.tscn")
@onready var grid = $chess_board/chess_grid
@onready var dark_pawn = preload("res://scenes/Pieces/pawn_test.tscn")
@onready var white_pawn = preload("res://scenes/Pieces/pawn.tscn")
@onready var chess_board = $chess_board

var dark_square = Color("#36454F")
var light_square = Color("#D3D3D3")
var grid_square_id := []

func _ready():
	for i in range(80):
		_create_square()
	await get_tree().create_timer(0.1).timeout
	squares_coloring()
	for i in range(1, 2):
		for j in range(8):
			_create_pawn(i, j)

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

func _create_pawn(row, col):
	var pawn = dark_pawn.instantiate()
	chess_board.add_child(pawn)
	pawn.global_position = grid_square_id[row * 8 + col].global_position

extends Control

@onready var square = preload("res://scenes/square.tscn")
@onready var grid = $chess_board/chess_grid
@onready var dark_pawn = preload("res://scenes/Pieces/pawn.tscn")
#@onready var board = $chess_board
var posx:int = 0
var dark_square = "#000000"
var light_square = "#ffffff"
var grid_square_id := []

func _ready():
	for i in range(80):
		_create_square()
		
	for i in range(8):
		_create_pawn()
	
	var color_bit = 0
	for i in range(10):
		for j in range(8):
			if j % 2 == color_bit:
				grid_square_id[i*8+j]._set_bg(dark_square)
			else: grid_square_id[i*8+j]._set_bg(light_square)
		if color_bit == 0:
			color_bit = 1
		else: color_bit = 0
	
	

func _process(_delta):
	pass

func _create_square():
	var created_square = square.instantiate()
	created_square.square_id = grid_square_id.size()
	grid.add_child(created_square)
	grid_square_id.push_back(created_square)

func _create_pawn():
	var pawn = dark_pawn.instantiate()
	pawn.position = Vector2(posx, 0)
	posx = posx + 20
	grid.add_child(pawn)


extends Control

@onready var square = preload("res://scenes/square.tscn")
@onready var grid = $chess_board/chess_grid

var dark_square = "#000000"
var light_square = "#ffffff"
var grid_square_id := []

func _ready():
	for i in range(80):
		_create_square()
	
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

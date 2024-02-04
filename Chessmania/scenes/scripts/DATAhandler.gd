extends Node

var pieces_dic = {
	"r": {
		"p_scene" : preload("res://scenes/Pieces/rook.tscn"),
		"p_type": 1
	},
	"n": {
		"p_scene": preload("res://scenes/Pieces/knight.tscn"),
		"p_type": 1
	},
	"b": {
		"p_scene": preload("res://scenes/Pieces/bishop.tscn"),
		"p_type": 1
	},
	"q": {
		"p_scene": preload("res://scenes/Pieces/queen.tscn"),
		"p_type": 1
	},
	"k": {
		"p_scene": preload("res://scenes/Pieces/king.tscn"),
		"p_type": 1
	},
	"p": {
		"p_scene": preload("res://scenes/Pieces/pawn.tscn"),
		"p_type": 1
	},
	"R": {
		"p_scene" : preload("res://scenes/Pieces/rook.tscn"),
		"p_type": 0
	},
	"N": {
		"p_scene": preload("res://scenes/Pieces/knight.tscn"),
		"p_type": 0
	},
	"B": {
		"p_scene": preload("res://scenes/Pieces/bishop.tscn"),
		"p_type": 0
	},
	"Q": {
		"p_scene": preload("res://scenes/Pieces/queen.tscn"),
		"p_type": 0
	},
	"K": {
		"p_scene": preload("res://scenes/Pieces/king.tscn"),
		"p_type": 0
	},
	"P": {
		"p_scene": preload("res://scenes/Pieces/pawn.tscn"),
		"p_type": 0
	},
}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

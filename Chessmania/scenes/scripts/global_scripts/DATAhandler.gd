extends Node

var pieces_dic = {
	"r": {
		"p_scene" : preload("res://scenes/Pieces/rook.tscn"),
		"p_type": 1,
		"p_name": "w_rook"
	},
	"n": {
		"p_scene": preload("res://scenes/Pieces/knight.tscn"),
		"p_type": 1,
		"p_name": "w_knight"
	},
	"b": {
		"p_scene": preload("res://scenes/Pieces/bishop.tscn"),
		"p_type": 1,
		"p_name": "w_bishop"
	},
	"q": {
		"p_scene": preload("res://scenes/Pieces/queen.tscn"),
		"p_type": 1,
		"p_name" : "w_queen"
	},
	"k": {
		"p_scene": preload("res://scenes/Pieces/king.tscn"),
		"p_type": 1,
		"p_name" : "w_king"
	},
	"p": {
		"p_scene": preload("res://scenes/Pieces/pawn.tscn"),
		"p_type": 1,
		"p_name" : "w_pawn"
	},
	"R": {
		"p_scene" : preload("res://scenes/Pieces/rook.tscn"),
		"p_type": 0,
		"p_name": "b_rook"
	},
	"N": {
		"p_scene": preload("res://scenes/Pieces/knight.tscn"),
		"p_type": 0,
		"p_name": "b_knight"
	},
	"B": {
		"p_scene": preload("res://scenes/Pieces/bishop.tscn"),
		"p_type": 0,
		"p_name": "b_bishop"
	},
	"Q": {
		"p_scene": preload("res://scenes/Pieces/queen.tscn"),
		"p_type": 0,
		"p_name": "b_queen"
	},
	"K": {
		"p_scene": preload("res://scenes/Pieces/king.tscn"),
		"p_type": 0,
		"p_name": "b_king"
	},
	"P": {
		"p_scene": preload("res://scenes/Pieces/pawn.tscn"),
		"p_type": 0,
		"p_name": "b_pawn"
	},
}

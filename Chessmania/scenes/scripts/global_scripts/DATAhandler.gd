extends Node

var pieces_dic = {
	######################### white pieces #########################
	"r": {# rok to the queen
		"p_scene" : preload("res://scenes/Pieces/rook.tscn"),
		"p_type": 1,
		"p_name": "w_rook",
		"p_pos": "l_rook",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"j": {# rok to the king
		"p_scene" : preload("res://scenes/Pieces/rook.tscn"),
		"p_type": 1,
		"p_name": "w_rook",
		"p_pos": "r_rook",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"n": {#knight to the queen
		"p_scene": preload("res://scenes/Pieces/knight.tscn"),
		"p_type": 1,
		"p_pos": "l_knight",
		"p_name": "w_knight",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"i": {#knight to the king
		"p_scene": preload("res://scenes/Pieces/knight.tscn"),
		"p_type": 1,
		"p_pos": "r_knight",
		"p_name": "w_knight",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"b": {#bishop to the queen
		"p_scene": preload("res://scenes/Pieces/bishop.tscn"),
		"p_type": 1,
		"p_pos": "l_bishop",
		"p_name": "w_bishop",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"l": {#bishop to the king
		"p_scene": preload("res://scenes/Pieces/bishop.tscn"),
		"p_type": 1,
		"p_pos": "r_bishop",
		"p_name": "w_bishop",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"q": {
		"p_scene": preload("res://scenes/Pieces/queen.tscn"),
		"p_type": 1,
		"p_pos": "n",
		"p_name" : "w_queen"
	},
	"k": {
		"p_scene": preload("res://scenes/Pieces/king.tscn"),
		"p_type": 1,
		"p_pos": "n",
		"p_name" : "w_king",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"p": {
		"p_scene": preload("res://scenes/Pieces/pawn.tscn"),
		"p_type": 1,
		"p_pos": "n",
		"p_name" : "w_pawn",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},


	######################### black pieces #########################
	"R": {#rook to the queen
		"p_scene" : preload("res://scenes/Pieces/rook.tscn"),
		"p_type": 0,
		"p_pos": "L_rook",
		"p_name": "b_rook",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"J": {#rook to the king
		"p_scene" : preload("res://scenes/Pieces/rook.tscn"),
		"p_type": 0,
		"p_pos": "R_rook",
		"p_name": "b_rook",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"N": {#knight to the queen
		"p_scene": preload("res://scenes/Pieces/knight.tscn"),
		"p_type": 0,
		"p_pos": "L_knight",
		"p_name": "b_knight",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"I": {#kinght to the king
		"p_scene": preload("res://scenes/Pieces/knight.tscn"),
		"p_type": 0,
		"p_pos": "R_knight",
		"p_name": "b_knight",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"B": {#bishop to the queen
		"p_scene": preload("res://scenes/Pieces/bishop.tscn"),
		"p_type": 0,
		"p_pos": "L_bishop",
		"p_name": "b_bishop",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"L": {#bishop to the king
		"p_scene": preload("res://scenes/Pieces/bishop.tscn"),
		"p_type": 0,
		"p_pos": "R_bishop",
		"p_name": "b_bishop",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"Q": {
		"p_scene": preload("res://scenes/Pieces/queen.tscn"),
		"p_type": 0,
		"p_pos": "N",
		"p_name": "b_queen",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"K": {
		"p_scene": preload("res://scenes/Pieces/king.tscn"),
		"p_type": 0,
		"p_pos": "N",
		"p_name": "b_king",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
	"P": {
		"p_scene": preload("res://scenes/Pieces/pawn.tscn"),
		"p_type": 0,
		"p_pos": "N",
		"p_name": "b_pawn",
		"stats": {
			"HP": 30,
			"Atk": 13,
			"Def": 17,
			"Spd": 7,
			"Lck": 3
		}
	},
}

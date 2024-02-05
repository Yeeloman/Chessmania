extends Node2D

@onready var icon = $icon
var b_king_icon = preload("res://assets/BlackPieces/blackKing.png")
var w_king_icon = preload("res://assets/WhitePieces/whiteKing.png")
var p_id := -1
var p_type: int
var p_name : String


func _ready():
	if p_type == 0:
		icon.texture = b_king_icon
	else: icon.texture = w_king_icon



func _process(_delta):
	pass

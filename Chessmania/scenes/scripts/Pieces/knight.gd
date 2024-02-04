extends Node2D

@onready var icon = $icon
var b_knight_icon = preload("res://assets/BlackPieces/blackKnight.png")
var w_knight_icon = preload("res://assets/WhitePieces/whiteKnight.png")
var p_id := -1
var p_type: int


func _ready():
	if p_type == 0:
		icon.texture = b_knight_icon
	else: icon.texture = w_knight_icon



func _process(_delta):
	pass

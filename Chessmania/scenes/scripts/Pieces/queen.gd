extends Node2D

@onready var icon = $icon
var b_queen_icon = preload("res://assets/BlackPieces/blackQueen.png")
var w_queen_icon = preload("res://assets/WhitePieces/whiteQueen.png")
var p_id := -1
var p_type: int


func _ready():
	if p_type == 0:
		icon.texture = b_queen_icon
	else: icon.texture = w_queen_icon



func _process(_delta):
	pass

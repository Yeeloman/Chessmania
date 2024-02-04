extends Node2D

@onready var icon = $icon
var b_bishop_icon = preload("res://assets/BlackPieces/blackBishop.png")
var w_bishop_icon = preload("res://assets/WhitePieces/whiteBishop.png")
var p_id := -1
var p_type: int


func _ready():
	if p_type == 0:
		icon.texture = b_bishop_icon
	else: icon.texture = w_bishop_icon



func _process(_delta):
	pass

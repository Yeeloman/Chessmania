extends Node2D

@onready var icon = $icon
var b_queen_icon = preload("res://assets/BlackPieces/blackQueen.png")
var w_queen_icon = preload("res://assets/WhitePieces/whiteQueen.png")
var p_id := -1
var p_type: int
var p_name : String
var p_pos: String
var stats: Dictionary


func _ready():
	if p_type == 0:
		icon.texture = b_queen_icon
	else: icon.texture = w_queen_icon



func _process(_delta):
	pass


func _on_area_queen_area_entered(_area):
	Signals.emit_signal('locker_entered', p_name)
	pass 


func _on_area_queen_area_exited(_area):
	Signals.emit_signal('locker_exited')
	pass # Replace with function body.

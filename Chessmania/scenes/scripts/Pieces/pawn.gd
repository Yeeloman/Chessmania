extends Node2D

@onready var icon = $icon

var b_pawn_icon = preload("res://assets/BlackPieces/blackPawn.png")
var w_pawn_icon = preload("res://assets/WhitePieces/whitePawn.png")
var p_id := -1
var p_type: int
var p_name : String
var p_pos: String
var stats: Dictionary


func _ready():
	if p_type == 0:
		icon.texture = b_pawn_icon
	else: icon.texture = w_pawn_icon



func _process(_delta):
	pass


func _on_pawn_area_area_entered(_area):
	Signals.emit_signal('locker_entered', p_name)
	pass 


func _on_pawn_area_area_exited(_area):
	Signals.emit_signal('locker_exited')
	pass 

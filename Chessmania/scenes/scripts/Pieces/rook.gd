extends Node2D

@onready var icon = $icon
var b_rook_icon = preload("res://assets/BlackPieces/blackRook.png")
var w_rook_icon = preload("res://assets/WhitePieces/whiteRook.png")
var p_id := -1
var p_type: int
var p_name : String
var p_pos: String

# piece stats
var HP
var Atk
var Def
var Spd
var Lck


func _ready():
	if p_type == 0:
		icon.texture = b_rook_icon
	else: icon.texture = w_rook_icon



func _process(_delta):
	pass


func _on_area_rook_area_entered(_area):
	Signals.emit_signal('locker_entered', p_name)


func _on_area_rook_area_exited(_area):
	Signals.emit_signal('locker_exited')

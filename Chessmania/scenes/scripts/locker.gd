extends Node2D

var is_active = false


func _ready():
	pass 


func _process(_delta):
	if Input.is_action_just_pressed("make_active"):
		if typeof(GV.piece_array[GV.posx*8+GV.posy]) != typeof(0):
			self.get_node("locker_rect").color = Color("#FF00AF90")
			Signals.emit_signal("locker_active")
			is_active = true
	if Input.is_action_just_pressed("make_passive"):
		if is_active == true:
			self.get_node("locker_rect").color = Color("#00FFAF90")
			Signals.emit_signal("locker_passive")
			is_active = false
			if GV.created_locker.global_position != GV.piece_active.global_position :
				PieceMovements._mini_hide_move()
				if typeof(GV.piece_array[GV.posx*8+GV.posy])!=typeof(0):
					PieceMovements._match_show_move(GV.piece_array[(GV.posx*8+GV.posy)].p_name)
				else:
					PieceMovements._mini_hide_move()
	pass

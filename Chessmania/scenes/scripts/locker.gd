extends Node2D

var is_active = false
var ESC_not_pushed = true

func _ready():
	pass 


func _process(_delta):


	if Input.is_action_just_pressed("make_active"):
		if GV.played_pieces_array.size() < 3:
			if typeof(GV.piece_array[GV.posx*8+GV.posy]) != typeof(0) and GV.cur_player == GV.hovered_piece.p_type:
				if GV.hovered_piece not in GV.played_pieces_array:
					self.get_node("locker_rect").color = Color("#FF00AF90")
					if ESC_not_pushed:
						Signals.emit_signal("locker_active")
						Signals.emit_signal("show_menu")
					is_active = true
			else:
				pass #show menu where you can end your turn
		else:
			Signals.end_turn.emit()
			pass


	if Input.is_action_just_pressed("make_passive"):
		if is_active:
			if not GV.action_made:
				self.get_node("locker_rect").color = Color("#00FFAF90")
				Signals.emit_signal("locker_passive")
				Signals.emit_signal("hide_menu")
				is_active = false
				if GV.created_locker.global_position != GV.piece_active.global_position :
					PieceMovements._mini_hide_move()
					if typeof(GV.piece_array[GV.posx*8+GV.posy])!=typeof(0):
						PieceMovements._match_show_move(GV.piece_array[(GV.posx*8+GV.posy)].p_name)
					else:
						PieceMovements._mini_hide_move()


	if Input.is_action_just_pressed("ESC"):
		if is_active:
			Signals.emit_signal('ESC_show')
			ESC_not_pushed = false
	pass

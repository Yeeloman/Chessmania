extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	# this signals handle if the player moves 3 pieces
	Signals.end_turn.connect(_on_end_turn_pressed)
	$".".hide()
	
	Signals.connect('show_menu', func(): 
		if GV.hovered_piece not in GV.played_pieces_array:
			self.get_node('container/move_action').grab_focus()
			GV.is_focus = self.get_node('container/move_action').has_focus()
			self.get_node('container/move_action').disabled = false
			self.get_node('container/attack_action').disabled = false
			if GV.piece_active not in GV.played_pieces_array:
				GV.action_made = false
			$".".show()
		)
	Signals.connect('hide_menu', func(): 
		GV.is_focus = self.get_node('container/move_action').has_focus()
		GV.action_made = false
		$".".hide()
		)
	
	Signals.ESC_show.connect(func():
		show()
		self.get_node('container/move_action').grab_focus()
		pass)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if GV.is_focus:
		#if Input.is_action_just_pressed("ui_up"):
			##self.get_node('container/attack_action').grab_focus()
			#pass
		#if Input.is_action_just_pressed("ui_down"):
			##self.get_node('container/attack_action').grab_focus()
			#pass
		#if Input.is_action_just_pressed("ui_right"):
			##self.get_node('container/attack_action').grab_focus()
			#pass
		#if Input.is_action_just_pressed("ui_left"):
			##self.get_node('container/attack_action').grab_focus()
			#pass
	pass



func _on_attack_action_pressed():
	GV.is_focus = false
	#GV.action_made = true
	self.hide()
	PA._show_attacks()


func _on_move_action_pressed():
	GV.is_focus = false
	#GV.action_made = true
	self.hide()


func _on_end_pressed():
	GV.played_pieces += 1
	GV.played_pieces_array.push_back(GV.piece_active)
	GV.created_locker.ESC_not_pushed = true
	hide()
	_handle_end_turn_locker()



func _on_end_turn_pressed():
	if GV.cur_player == GV.player_1:
		GV.cur_player = GV.player_2
		GV.played_pieces = 0
	else:
		GV.cur_player = GV.player_1
		GV.played_pieces = 0
	hide()
	_handle_end_turn_locker()
	GV.played_pieces_array.clear()
	self.get_node('container/move_action').show()
	self.get_node('container/attack_action').show()
	self.get_node('container/end').show()

func _handle_end_turn_locker():
	if GV.created_locker.is_active == true:
		GV.created_locker.get_node("locker_rect").color = Color("#00FFAF90")
		Signals.emit_signal("locker_passive")
		Signals.emit_signal("hide_menu")
		GV.created_locker.is_active = false
		if GV.created_locker.global_position != GV.piece_active.global_position :
			PieceMovements._mini_hide_move()
			if typeof(GV.piece_array[GV.posx*8+GV.posy])!=typeof(0):
				PieceMovements._match_show_move(GV.piece_array[(GV.posx*8+GV.posy)].p_name)
			else:
				PieceMovements._mini_hide_move()

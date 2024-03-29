extends Node


var down_pressed = false
var up_pressed = false
var right_pressed = false
var left_pressed = false

#func _process(_delta):
	#if Input.is_action_just_released("down"):
		#PieceMovements._on_hide_move()
		#pass
	#if Input.is_action_just_released("up"):
		#PieceMovements._on_hide_move()
		#pass
	#if Input.is_action_just_released("right"):
		#PieceMovements._on_hide_move()
		#pass
	#if Input.is_action_just_released("left"):
		#PieceMovements._on_hide_move()
		#pass


# handles the locker instance movement
func _handle_locker_mov():
	#if not 	GV.created_menu.get_node('container/attack_action').has_focus():
	if Input.is_action_just_pressed("down") and not down_pressed and not GV.is_focus:
		down_pressed = true
		if ((GV.posx+1)*8)+GV.posy < 80 and ((GV.posx+1)*8)+GV.posy>=0 :
			GV.created_locker.global_position = GV.grid_square_id[((GV.posx+1)*8)+GV.posy].global_position
			GV.posx += 1
	elif not Input.is_action_pressed("down"):
		down_pressed = false

	if Input.is_action_just_pressed("up") and not up_pressed and not GV.is_focus:
		up_pressed = true
		if ((GV.posx-1)*8)+GV.posy < 80 and ((GV.posx-1)*8)+GV.posy>=0 :
			GV.created_locker.global_position = GV.grid_square_id[((GV.posx-1)*8)+GV.posy].global_position
			GV.posx -= 1
	elif not Input.is_action_pressed("up"):
		up_pressed = false

	if Input.is_action_just_pressed("right") and not right_pressed and not GV.is_focus:
		right_pressed = true
		if (GV.posx*8)+GV.posy+1 < 80 and (GV.posx*8)+GV.posy+1>=0 :
			GV.created_locker.global_position = GV.grid_square_id[(GV.posx*8)+GV.posy+1].global_position
			GV.posy += 1
	elif Input.is_action_pressed("right"):
		right_pressed = false

	if Input.is_action_just_pressed("left") and not left_pressed and not GV.is_focus:
		left_pressed = true
		if (GV.posx*8)+GV.posy-1 < 80 and (GV.posx*8)+GV.posy-1>=0 :
			GV.created_locker.global_position = GV.grid_square_id[(GV.posx*8)+GV.posy-1].global_position
			GV.posy -= 1
	elif Input.is_action_pressed("left"):
		left_pressed = false

# handles the state where the locker is active
func _on_locker_active():
	#await GV.created_menu.get_node('container/move_action').is_pressed()
	#Signals.emit_signal('show_menu')
	Signals.disconnect('locker_active',_on_locker_active)
	Signals.connect('locker_passive', _on_locker_passive)
	for el in GV.piece_array :
		if typeof(el) != typeof(0) :
			if el.global_position == GV.created_locker.global_position : 
				GV.piece_active = el
				GV.prev_posx = GV.posx
				GV.prev_posy = GV.posy


# handle the state where the locker is passive
func _on_locker_passive():
	Signals.emit_signal('hide_menu')
	Signals.disconnect('locker_passive',_on_locker_passive)
	Signals.connect('locker_active', _on_locker_active)
	#Signals.emit_signal('same_piece', GV.piece_array[(GV.posx*8+GV.posy)].p_name)

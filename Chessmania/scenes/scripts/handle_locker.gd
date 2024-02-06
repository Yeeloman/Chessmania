extends Node


var down_pressed = false
var up_pressed = false
var right_pressed = false
var left_pressed = false

# handles the locker instance movement
func _handle_locker_mov():
	if Input.is_action_just_pressed("down") and not down_pressed:
		down_pressed = true
		if ((GV.posx+1)*8)+GV.posy < 80 and ((GV.posx+1)*8)+GV.posy>=0 :
			GV.created_locker.global_position = GV.grid_square_id[((GV.posx+1)*8)+GV.posy].global_position
			GV.posx += 1
	elif not Input.is_action_pressed("down"):
		down_pressed = false

	if Input.is_action_just_pressed("up") and not up_pressed:
		up_pressed = true
		if ((GV.posx-1)*8)+GV.posy < 80 and ((GV.posx-1)*8)+GV.posy>=0 :
			GV.created_locker.global_position = GV.grid_square_id[((GV.posx-1)*8)+GV.posy].global_position
			GV.posx -= 1
	elif not Input.is_action_pressed("up"):
		up_pressed = false

	if Input.is_action_just_pressed("right") and not right_pressed:
		right_pressed = true
		if (GV.posx*8)+GV.posy+1 < 80 and (GV.posx*8)+GV.posy+1>=0 :
			GV.created_locker.global_position = GV.grid_square_id[(GV.posx*8)+GV.posy+1].global_position
			GV.posy += 1
	elif Input.is_action_pressed("right"):
		right_pressed = false

	if Input.is_action_just_pressed("left") and not left_pressed:
		left_pressed = true
		if (GV.posx*8)+GV.posy-1 < 80 and (GV.posx*8)+GV.posy-1>=0 :
			GV.created_locker.global_position = GV.grid_square_id[(GV.posx*8)+GV.posy-1].global_position
			GV.posy -= 1
	elif Input.is_action_pressed("left"):
		left_pressed = false


# handles the state where the locker is active
func _on_locker_active():
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
	Signals.disconnect('locker_passive',_on_locker_passive)
	Signals.connect('locker_active', _on_locker_active)

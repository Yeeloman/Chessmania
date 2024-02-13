extends Node


var pawn_attack = [[1,0],[1,1],[1,-1]]
var board_edges:= [[0,7],[8,15],[16,23],[24,31],[32,39],
					[40,47],[48,55],[56,63],[64,71],[72,79]]

var rook_attack := [[0,1],[0,-1],[1,0],[-1,0]]

func _show_attacks():
	PieceMovements._mini_hide_move()
	match GV.piece_active.p_name: 
		"w_pawn", "b_pawn":
			_show_pawn_attack()
		"w_queen", "b_queen":
			_show_queen_attack()
		"w_rook", "b_rook":
			_show_rook_attack()
		"w_knight", "b_knight":
			_show_knight_attack()
		"w_bishop", "b_bishop":
			_show_bishop_attack()
		_ :
			pass

func _show_pawn_attack():
	var colored := []
	var allowed_attacks := []
	if GV.piece_active.p_name == "w_pawn":
		for el in pawn_attack:
			var att
			var check = ((GV.posx+el[0])*8)+(GV.posy+el[1])
			if GV.posx+1>= 0 and GV.posx+1<=9:
				if check>=board_edges[GV.posx+1][0] and check<=board_edges[GV.posx+1][1]:
					att = ((GV.posx+el[0])*8)+(GV.posy+el[1])
			if typeof(att)==TYPE_INT:
				allowed_attacks.append(att)
		for el in allowed_attacks :
			var move = GV.grid_square_id[el]
			move.get_node("attack").color = GV.attack_color
			colored.append(move)
		await get_tree().create_timer(0.1).timeout
		for el in colored : 
			GV.attack_array.push_back(el)
		pass
	else : 
		for el in pawn_attack:
			var att
			var check = ((GV.posx-el[0])*8)+(GV.posy-el[1])
			if GV.posx-1>=0 and GV.posx-1<=9:
				if check>=board_edges[GV.posx-1][0] and check<=board_edges[GV.posx-1][1]:
					att = ((GV.posx-el[0])*8)+(GV.posy-el[1])
			if typeof(att)==TYPE_INT:
				allowed_attacks.append(att)
		for el in allowed_attacks :
			var move = GV.grid_square_id[el]
			move.get_node("attack").color = GV.attack_color
			colored.append(move)
		await get_tree().create_timer(0.1).timeout
		for el in colored : 
			GV.attack_array.push_back(el)



func _show_queen_attack():
	pass



func _show_rook_attack():
	var allowed_attacks := []
	var colored := []
	for i in rook_attack:
		var move
		if i[0]==0:
			var check = ((GV.posx+i[0])*8)+(GV.posy+i[1])
			if check>=board_edges[GV.posx][0] and check<=board_edges[GV.posx][1]:
				move = int(check)
		else :
			move = int(((GV.posx+i[0])*8)+(GV.posy+i[1]))
		if typeof(move) == TYPE_INT:
			if move<80 and move>=0 :
				allowed_attacks.append(move)
	for el in allowed_attacks :
		var move = GV.grid_square_id[el]
		move.get_node("attack").color = GV.attack_color
		colored.append(move)
	await get_tree().create_timer(0.1).timeout
	for el in colored : 
		GV.attack_array.push_back(el)
	pass



func _show_knight_attack():
	pass



func _show_bishop_attack():
	pass


func _hide_attack():
	if GV.created_locker.is_active == true:
		for i in range(GV.attack_array.size()):
			GV.attack_array[i].get_node("attack").color = GV.transparent
		GV.attack_array.clear()

func _on_attack():
	if GV.created_locker.is_active :
		if Input.is_action_just_pressed("move"):
			for el in GV.attack_array:
				if GV.hovered_piece:
					if el.global_position==GV.hovered_piece.global_position and GV.hovered_piece.p_type!=GV.piece_active.p_type and typeof(GV.hovered_piece)!=TYPE_INT:
						_damage()
						GV.created_menu.show()
						GV.created_menu.get_node('container/attack_action').grab_focus()
						GV.created_menu.get_node('container/attack_action').disabled = true
						GV.action_made = true

func _damage():
	var damage = GV.piece_active.Atk
	if damage>GV.hovered_piece.cur_hp :
		damage = GV.hovered_piece.cur_hp
	GV.hovered_piece.cur_hp -= damage
	print(GV.hovered_piece.cur_hp)
	if GV.hovered_piece.cur_hp <= 0:
		if GV.hovered_piece.display_name == "King":
			Signals.king_died.emit()
			return
		await get_tree().create_timer(0.1).timeout
		GV.hovered_piece.queue_free()
		GV.hovered_piece = null
		GV.piece_array[(GV.posx*8)+GV.posy]=0
	_hide_attack()

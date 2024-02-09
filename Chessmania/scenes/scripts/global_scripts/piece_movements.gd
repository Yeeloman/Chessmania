extends Node


var king_moves := [[0,1],[0,-1],[1,0], 
					[-1,0],[-1,-1],[-1,1], 
					[1,1],[1,-1]]
var rook_moves := [[0,1],[0,-1],[1,0],[-1,0]]
var bishop_moves := [[1,1],[-1,1],[-1,-1],[1,-1]]
var knight_moves := [[2,1],[2,-1],[1,2],[-1,2],
					[1,-2],[-1,-2],[-2,-1],[-2,1]]

var knight_two :=[[2,1],[2,-1],[-2,-1],[-2,1]]
var knight_one :=[[1,2],[-1,2],[1,-2],[-1,-2]]
var board_edges:= [[0,7],[8,15],[16,23],[24,31],[32,39],
					[40,47],[48,55],[56,63],[64,71],[72,79]]

func _match_show_move(arg):
	GV.hovered_piece = GV.piece_array[GV.posx*8+GV.posy]
	if GV.created_locker.is_active == false:
		_mini_hide_move()
	match arg: 
		"w_pawn", "b_pawn":
			_show_pawn_move(arg)
		"w_king", "b_king":
			_show_king_move(arg)
		"w_queen", "b_queen":
			_show_queen_move(arg)
		"w_rook", "b_rook":
			_show_rook_move(arg)
		"w_knight", "b_knight":
			_show_knight_move(arg)
		"w_bishop", "b_bishop":
			_show_bishop_move(arg)
		_ :
			pass


func _show_pawn_move(arg):
	if GV.created_locker.is_active == false :
		if arg == "w_pawn" :
			if GV.posx != 1:
				if typeof(GV.piece_array[((GV.posx+1)*8)+GV.posy])==typeof(0):
					var move = GV.grid_square_id[((GV.posx+1)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
			else:
				if typeof(GV.piece_array[((GV.posx+1)*8)+GV.posy])==typeof(0) and typeof(GV.piece_array[((GV.posx+2)*8)+GV.posy])==typeof(0):
					var move = GV.grid_square_id[((GV.posx+1)*8)+GV.posy]
					var move_two = GV.grid_square_id[((GV.posx+2)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					move_two.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
					GV.colored_array.push_back(move_two)
				elif typeof(GV.piece_array[((GV.posx+1)*8)+GV.posy])==typeof(0) and !(typeof(GV.piece_array[((GV.posx+2)*8)+GV.posy])==typeof(0)) :
					var move = GV.grid_square_id[((GV.posx+1)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
				else : 
					pass
		if arg == "b_pawn":
			if GV.posx != 8:
				if typeof(GV.piece_array[((GV.posx-1)*8)+GV.posy])==typeof(0):
					var move = GV.grid_square_id[((GV.posx-1)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
			else:
				if typeof(GV.piece_array[((GV.posx-1)*8)+GV.posy])==typeof(0) and typeof(GV.piece_array[((GV.posx-2)*8)+GV.posy])==typeof(0):
					var move = GV.grid_square_id[((GV.posx-1)*8)+GV.posy]
					var move_two = GV.grid_square_id[((GV.posx-2)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					move_two.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
					GV.colored_array.push_back(move_two)
				elif typeof(GV.piece_array[((GV.posx-1)*8)+GV.posy])==typeof(0) and !(typeof(GV.piece_array[((GV.posx-2)*8)+GV.posy])==typeof(0)) :
					var move = GV.grid_square_id[((GV.posx-1)*8)+GV.posy]
					move.get_node("mov").color = GV.move_color
					await get_tree().create_timer(0.1).timeout
					GV.colored_array.push_back(move)
				else :
					pass



func _show_king_move(_arg):
	if GV.created_locker.is_active == false :
		var allowed_moves := []
		var colored := []
		for i in rook_moves:
			var move
			if i[0]==0:
				var check = ((GV.posx+i[0])*8)+(GV.posy+i[1])
				if check>=board_edges[GV.posx][0] and check<=board_edges[GV.posx][1]:
					move = int(check)
			else :
				move = int(((GV.posx+i[0])*8)+(GV.posy+i[1]))
			if typeof(move) == TYPE_INT:
				if move<80 and move>=0 :
					if typeof(GV.piece_array[move])==typeof(0) :
						allowed_moves.append(move)
		for i in bishop_moves :
			var move
			var check = ((GV.posx+i[0])*8)+(GV.posy+i[1])
			if (GV.posx+1)>=0 and (GV.posx+1)<=9:
				if check>=board_edges[GV.posx+1][0] and check<=board_edges[GV.posx+1][1]:
					move = int(check)
			if (GV.posx-1)>=0 and (GV.posx-1)<=9:
				if check>=board_edges[GV.posx-1][0] and check<=board_edges[GV.posx-1][1]:
					move = int(check)
			if typeof(move)==TYPE_INT:
				if move<80 and move>=0:
					if typeof(GV.piece_array[move])==typeof(0) :
						allowed_moves.append(move)
		for el in allowed_moves :
			var move = GV.grid_square_id[el]
			move.get_node("mov").color = GV.move_color
			colored.append(move)
		await get_tree().create_timer(0.1).timeout
		for el in colored : 
			GV.colored_array.push_back(el)


func _show_queen_move(_arg):
	if GV.created_locker.is_active == false :
		var allowed_moves := []
		var colored := []
		for i in rook_moves:
			var move
			if i[0]==0:
				var check = ((GV.posx+i[0])*8)+(GV.posy+i[1])
				if check>=board_edges[GV.posx][0] and check<=board_edges[GV.posx][1]:
					move = int(check)
			else :
				move = int(((GV.posx+i[0])*8)+(GV.posy+i[1]))
			if typeof(move) == TYPE_INT:
				if move<80 and move>=0 :
					if typeof(GV.piece_array[move])==typeof(0) :
						allowed_moves.append(move)
						var j = i.map(func(value):return value*2)
						var sec_move
						if j[0]==0:
							var sec_check = ((GV.posx+j[0])*8)+(GV.posy+j[1])
							if sec_check>=board_edges[GV.posx][0] and sec_check<=board_edges[GV.posx][1]:
								sec_move = int(((GV.posx+j[0])*8)+(GV.posy+j[1]))
						else :
							sec_move = int(((GV.posx+j[0])*8)+(GV.posy+j[1]))
						if typeof(sec_move) == TYPE_INT:
							if sec_move<80 and sec_move>=0:
								if typeof(GV.piece_array[sec_move])==typeof(0) :
									allowed_moves.append(sec_move)
		for i in bishop_moves :
			var move
			var check = ((GV.posx+i[0])*8)+(GV.posy+i[1])
			if (GV.posx+1)>=0 and (GV.posx+1)<=9:
				if check>=board_edges[GV.posx+1][0] and check<=board_edges[GV.posx+1][1]:
					move = int(check)
			if (GV.posx-1)>=0 and (GV.posx-1)<=9:
				if check>=board_edges[GV.posx-1][0] and check<=board_edges[GV.posx-1][1]:
					move = int(check)
			if typeof(move)==TYPE_INT:
				if move<80 and move>=0:
					if typeof(GV.piece_array[move])==typeof(0) :
						allowed_moves.append(move)
						var j = i.map(func(value):return value*2)
						var sec_move
						var sec_check = ((GV.posx+j[0])*8)+(GV.posy+j[1])
						if (GV.posx+2)>=0 and (GV.posx+2)<=9:
							if sec_check>=board_edges[GV.posx+2][0] and sec_check<=board_edges[GV.posx+2][1]:
								sec_move = int(sec_check)
						if (GV.posx-2)>=0 and (GV.posx-2)<=9:
							if sec_check>=board_edges[GV.posx-2][0] and sec_check<=board_edges[GV.posx-2][1]:
								sec_move = int(sec_check)
						if typeof(sec_move)==TYPE_INT:
							if sec_move<80 and sec_move>=0:
								if typeof(GV.piece_array[sec_move])==typeof(0) :
									allowed_moves.append(sec_move)
		for el in allowed_moves :
			var move = GV.grid_square_id[el]
			move.get_node("mov").color = GV.move_color
			colored.append(move)
		await get_tree().create_timer(0.1).timeout
		for el in colored : 
			GV.colored_array.push_back(el)
	pass

func _show_knight_move(_arg):
	if GV.created_locker.is_active == false :
		var allowed_moves := []
		var colored := []
		for i in knight_two :
			var move
			var check = ((GV.posx+i[0])*8)+(GV.posy+i[1])
			if (GV.posx+2)>=0 and (GV.posx+2)<=9:
				if check>=board_edges[GV.posx+2][0] and check<=board_edges[GV.posx+2][1]:
					move = int(check)
			if (GV.posx-2)>=0 and (GV.posx-2)<=9:
				if check>=board_edges[GV.posx-2][0] and check<=board_edges[GV.posx-2][1]:
					move = int(check)
			if typeof(move)==TYPE_INT:
				if move<80 and move>=0:
					if typeof(GV.piece_array[move])==typeof(0) :
						allowed_moves.append(move)
		for i in knight_one :
			var move
			var check = ((GV.posx+i[0])*8)+(GV.posy+i[1])
			if (GV.posx+1)>=0 and (GV.posx+1)<=9:
				if check>=board_edges[GV.posx+1][0] and check<=board_edges[GV.posx+1][1]:
					move = int(check)
			if (GV.posx-1)>=0 and (GV.posx-1)<=9:
				if check>=board_edges[GV.posx-1][0] and check<=board_edges[GV.posx-1][1]:
					move = int(check)
			if typeof(move)==TYPE_INT:
				if move<80 and move>=0:
					if typeof(GV.piece_array[move])==typeof(0) :
						allowed_moves.append(move)
		for el in allowed_moves :
			var move = GV.grid_square_id[el]
			move.get_node("mov").color = GV.move_color
			colored.append(move)
		await get_tree().create_timer(0.1).timeout
		for el in colored : 
			GV.colored_array.push_back(el)


func _show_rook_move(_arg):
	if GV.created_locker.is_active == false :
		var allowed_moves := []
		var colored := []
		for i in rook_moves:
			var move
			if i[0]==0:
				var check = ((GV.posx+i[0])*8)+(GV.posy+i[1])
				if check>=board_edges[GV.posx][0] and check<=board_edges[GV.posx][1]:
					move = int(check)
			else :
				move = int(((GV.posx+i[0])*8)+(GV.posy+i[1]))
			print(move)
			if typeof(move) == TYPE_INT:
				if move<80 and move>=0 :
					if typeof(GV.piece_array[move])==typeof(0) :
						allowed_moves.append(move)
						var j = i.map(func(value):return value*2)
						var sec_move
						if j[0]==0:
							var sec_check = ((GV.posx+j[0])*8)+(GV.posy+j[1])
							if sec_check>=board_edges[GV.posx][0] and sec_check<=board_edges[GV.posx][1]:
								sec_move = int(((GV.posx+j[0])*8)+(GV.posy+j[1]))
						else :
							sec_move = int(((GV.posx+j[0])*8)+(GV.posy+j[1]))
						if typeof(sec_move) == TYPE_INT:
							if sec_move<80 and sec_move>=0:
								if typeof(GV.piece_array[sec_move])==typeof(0) :
									allowed_moves.append(sec_move)
		for el in allowed_moves :
			var move = GV.grid_square_id[el]
			move.get_node("mov").color = GV.move_color
			colored.append(move)
		await get_tree().create_timer(0.1).timeout
		for el in colored : 
			GV.colored_array.push_back(el)
	pass

func _show_bishop_move(_arg):
	if GV.created_locker.is_active == false :
		var allowed_moves := []
		var colored := []
		for i in bishop_moves :
			var move
			var check = ((GV.posx+i[0])*8)+(GV.posy+i[1])
			if (GV.posx+1)>=0 and (GV.posx+1)<=9:
				if check>=board_edges[GV.posx+1][0] and check<=board_edges[GV.posx+1][1]:
					move = int(check)
			if (GV.posx-1)>=0 and (GV.posx-1)<=9:
				if check>=board_edges[GV.posx-1][0] and check<=board_edges[GV.posx-1][1]:
					move = int(check)
			if typeof(move)==TYPE_INT:
				if move<80 and move>=0:
					if typeof(GV.piece_array[move])==typeof(0) :
						allowed_moves.append(move)
						var j = i.map(func(value):return value*2)
						var sec_move
						var sec_check = ((GV.posx+j[0])*8)+(GV.posy+j[1])
						if (GV.posx+2)>=0 and (GV.posx+2)<=9:
							if sec_check>=board_edges[GV.posx+2][0] and sec_check<=board_edges[GV.posx+2][1]:
								sec_move = int(sec_check)
						if (GV.posx-2)>=0 and (GV.posx-2)<=9:
							if sec_check>=board_edges[GV.posx-2][0] and sec_check<=board_edges[GV.posx-2][1]:
								sec_move = int(sec_check)
						if typeof(sec_move)==TYPE_INT:
							if sec_move<80 and sec_move>=0:
								if typeof(GV.piece_array[sec_move])==typeof(0) :
									allowed_moves.append(sec_move)
		for el in allowed_moves :
			var move = GV.grid_square_id[el]
			move.get_node("mov").color = GV.move_color
			colored.append(move)
		await get_tree().create_timer(0.1).timeout
		for el in colored : 
			GV.colored_array.push_back(el)
	pass









func _move_pawn():
	pass
func _move_rook():
	pass

func _move_knight():
	pass

func _move_bishop():
	pass

func _move_king():
	pass

func _move_queen():
	pass

func _ready():
	pass

func _process(_delta):
	pass


# moves the target piece
func _on_piece_move():
	if GV.created_locker.is_active == true : 
		if Input.is_action_just_pressed("move") :
			for el in GV.colored_array:
				if el.global_position == GV.created_locker.global_position:
					GV.piece_active.global_position = GV.created_locker.global_position
					GV.piece_array[(GV.prev_posx*8)+GV.prev_posy] = 0
					GV.piece_array[(GV.posx*8)+GV.posy] = GV.piece_active
					_mini_hide_move() # to hide move after the piece is moved
	pass


# hide the piece movement after moving the piece
func _mini_hide_move():
	for i in range(GV.colored_array.size()):
		GV.colored_array[i].get_node("mov").color = GV.transparent
	GV.colored_array.clear()


func find_duplicates(arr: Array) -> Array:
	var frequency_map = {}
	var duplicates = []
	for num in arr:
		if frequency_map.has(num):
			frequency_map[num] += 1
		else:
			frequency_map[num] = 1
	for num in frequency_map.keys():  
		var frequency = frequency_map[num]  
		if frequency > 1:
			duplicates.append(num)
	return duplicates
	
func find_non_duplicates(arr: Array) -> Array:
	var frequency_map = {}
	var non_duplicates = []

	# Build frequency map
	for num in arr:
		if frequency_map.has(num):
			frequency_map[num] += 1
		else:
			frequency_map[num] = 1

	# Find non-duplicates
	for num in frequency_map.keys():  # Iterate over keys
		var frequency = frequency_map[num]  # Access value for the key
		if frequency == 1:  # If frequency is 1, it's non-duplicate
			non_duplicates.append(num)

	return non_duplicates

# undo the coloring move changes
func _on_hide_move():
	if GV.created_locker.is_active == false:
		for i in range(GV.colored_array.size()):
			GV.colored_array[i].get_node("mov").color = GV.transparent
		GV.colored_array.clear()

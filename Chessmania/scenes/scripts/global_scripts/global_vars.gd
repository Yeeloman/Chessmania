extends Node


var dark_square = Color("#36454F")
var light_square = Color("#D3D3D3")
var move_color = Color("#3EA3AC90")
var attack_color = Color("#AC473E90")
var transparent = Color("#fa6ca000")
var active_color_locker = Color("#0000FF90")
var passive_color_locker = Color("#00FFAF90")

var starting_pos = "rnbqklij/pppppppp/8/8/8/8/8/8/PPPPPPPP/RNBQKLIJ"


var grid_square_id := []
var piece_array := []
var colored_array := []

var created_locker
var created_displayer
var created_player

var display_container

var piece_active
var hovered_piece


var prev_posx
var prev_posy
var posx = 0
var posy = 3
var prevpos

extends Control

var main_game = preload("res://scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if GV.cur_player == 0:
		$player_winner_con/winner.text = "Player 1 win"
	else:
		$player_winner_con/winner.text = "Player 2 win"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.

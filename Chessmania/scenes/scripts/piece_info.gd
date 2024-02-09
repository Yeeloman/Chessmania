extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$TabContainer/HP/selected_p.text = GV.hovered_piece.display_name
	$TabContainer/HP/HP_bar.max_value = GV.hovered_piece.HP
	pass

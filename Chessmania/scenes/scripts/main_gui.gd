extends Control
var intro_packed = preload("res://scenes/intro.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var intro_scene = intro_packed.instantiate()
	add_child(intro_scene)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

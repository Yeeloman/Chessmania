extends Control

var main_game = preload("res://scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$menu_container/start_button.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_start_button_pressed():
	var main_scene = main_game.instantiate()
	get_parent().add_child(main_scene)
	await get_tree().create_timer(0.1).timeout
	queue_free()
	pass # Replace with function body.

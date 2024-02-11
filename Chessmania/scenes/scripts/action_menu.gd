extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".hide()
	Signals.connect('show_menu', func(): 
		self.get_node('container/attack_action').grab_focus()
		GV.is_focus = self.get_node('container/attack_action').has_focus()
		self.get_node('container/move_action').disabled = false
		self.get_node('container/attack_action').disabled = false
		$".".show())
	Signals.connect('hide_menu', func(): 
		GV.is_focus = self.get_node('container/attack_action').has_focus()
		$".".hide())
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
	self.hide()
	PA._show_attacks()
	pass # Replace with function body.


func _on_move_action_pressed():
	#Signals.emit_signal('move_pressed')
	GV.is_focus = false
	self.hide()
	pass # Replace with function body.

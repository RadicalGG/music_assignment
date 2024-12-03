extends Node2D

var pattern = []
var steps = 16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# get the number of different sounds I can  play
	# these are added in the editor
	num_samples = get_child_count() - 1
	
	for i in range(steps):
		pattern.push_back(randi_range(0, num_samples -1 ))
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

var current:int
var num_samples:int

var dir = 1

func _on_timer_timeout1() -> void:
	
	# go forward and backward through the steps
	
	# get the value from the array
	# the value will tell us whish sound to play
	var sn = pattern[current]
	
	# -1 indicates dont play anything this step
	if sn != -1:		
		var s = get_child(sn)
		s.play()
		print(current)
	
	# go to the next step
	current = current + dir
	
	# if we reach the last step, change direction and go back
	if current == steps:
		current = current - 1
		dir = - dir
	# if we reach the first step change direction and go forwards
	if current == -1:
		current = 0
		dir = - dir
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	# gets the child node, which is an AudioPlayer
	# current is the index of node
	var s = get_child(current)
	s.play()
	print(current)
	
	# add one to current so we go to the next one
	current = current + 1
	
	# if we reach the last one, go back to the start
	if current == steps:
		current = 0
	
	pass # Replace with function body.

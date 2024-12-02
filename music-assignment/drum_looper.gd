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
	var sn = pattern[current]
	if sn != -1:		
		var s = get_child(sn)
		s.play()
		print(current)
	current = current + dir
	if current == steps:
		current = current - 1
		dir = - dir
	if current == -1:
		current = 0
		dir = - dir
	pass # Replace with function body.


func _on_button_2_button_down() -> void:
	var s = get_child(current)
	s.play()
	print(current)
	current = current + 1
	
	if current == steps:
		current = 0
	
	pass # Replace with function body.

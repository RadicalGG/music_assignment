extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


var i = 0

func _draw() -> void:
	if i == 0:
		draw_rect(Rect2(0, 0, 70, 100), Color.RED)
	elif i == 1:
		draw_rect(Rect2(0, 0, 70, 100), Color.BLUE) 

var last_pressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_key_pressed(KEY_0) && ! last_pressed:
		$AudioStreamPlayer.play()
		last_pressed = true
	else:
		last_pressed = false
		
	
	if Input.is_action_just_pressed("g"):
		if $AudioStreamPlayer.playing:
			$AudioStreamPlayer.stop()
		else:	
			$AudioStreamPlayer.play()
	queue_redraw()
	pass

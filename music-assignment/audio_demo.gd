extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	if $AudioStreamPlayer.playing:
		$Button.text = "Play"
		$AudioStreamPlayer.stop()
	else:
		$Button.text = "Stop"
		$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_h_slider_value_changed(value: float) -> void:
	$AudioStreamPlayer.pitch_scale = value
	pass # Replace with function body.


func _on_h_slider_2_value_changed(value: float) -> void:
	var f:AudioEffectPhaser = AudioServer.get_bus_effect(0, 0)
	f.rate_hz = value
	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Hwello")
	pass # Replace with function body.


func _on_area_2d_mouse_entered(e) -> void:

	pass # Replace with function body.


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	
	var s = remap(event.position.x, 208, 508, 0, 2)
	$AudioStreamPlayer.pitch_scale = s
	var p = get_viewport().get_mouse_position()
	
	# print(p)
	print("89Hwello from the mouse")
	
	
	pass # Replace with function body.


func _on_h_slider_3_value_changed(value: float) -> void:
	
	
	$drum_looper/Timer.wait_time = remap(value, 0, 100, 5, 0.01)
	pass # Replace with function body.


func _on_button_3_button_down() -> void:
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_h_slider_4_value_changed(value: float) -> void:
	var lp:AudioEffectLowPassFilter = AudioServer.get_bus_effect(0, 1)
	lp.cutoff_hz = value
	pass # Replace with function body.


func _on_h_slider_5_value_changed(value: float) -> void:
	var lp:AudioEffectHighPassFilter = AudioServer.get_bus_effect(0, 2)
	lp.cutoff_hz = value
	print(value)
	pass # Replace with function body.

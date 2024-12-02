extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_h_slider_value_changed(value: float) -> void:
	var phaser:AudioEffectPhaser = AudioServer.get_bus_effect(0, 0)
	phaser.rate_hz = value
	pass # Replace with function body.

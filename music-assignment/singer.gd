extends Node2D

var noise:FastNoiseLite

var sample_hz = 22050.0 # Keep the number of samples to mix low, GDScript is not super fast.
var pulse_hz = 440.0
var phase = 0.0

var playback: AudioStreamPlayback = null # Actual playback stream, assigned in _ready().

@export var range_start = -500
@export var range_end = 4000

var t = 0
var speed = 20



func _fill_buffer():
	var increment = pulse_hz / sample_hz

	var to_fill = playback.get_frames_available()
	while to_fill > 0:
		playback.push_frame(Vector2.ONE * sin(phase * TAU)) # Audio frames are stereo.
		phase = fmod(phase + increment, 1.0)
		to_fill -= 1

func _ready():
	# Setting mix rate is only possible before play().
	$Player.stream.mix_rate = sample_hz
	$Player.play()
	playback = $Player.get_stream_playback()
	# `_fill_buffer` must be called *after* setting `playback`,
	# as `fill_buffer` uses the `playback` member variable.
	
	noise = FastNoiseLite.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var n = noise.get_noise_1d(t * speed)
	
	
	# remap remaps a number in a range to a new range
	# example
	# remap(75, 0, 100, -1, 1) # Returns 0.5
	pulse_hz = remap(n, -1, 1, range_start, range_end)
	print(n)
	var h = remap(n, -1, 1, 10, 300)
	$"../mouth".size.y = h
	$"../mouth".size.x = h
	t += delta
	_fill_buffer()
	pass

extends Line2D



export (float, 0.5, 3.0) var spread_angle := PI/3.0
export (int, 1, 36) var segments := 36

onready var sparks := $sparks


func _ready() -> void:
	randomize()
	set_as_toplevel(true)
	create(Vector2.ZERO, Vector2(400, 400))

func create(start: Vector2, end: Vector2) -> void:

	var _points := []
	var _current := start
	var _segment_length := start.distance_to(end) / segments

	_points.append(start)

	for segment in range(segments):
		var _rotation := rand_range(-spread_angle / 2, spread_angle / 2)
		var _new := _current + (_current.direction_to(end) * _segment_length).rotated(_rotation)
		_points.append(_new)
		_current = _new

	_points.append(end)
	points = _points

	sparks.global_position = end

extends Node
class_name Walker

const DIRECTIONS = [Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN]

var rand_steps = rand_range(2,15)

var position = Vector2.ZERO
var direction = Vector2.RIGHT
var borders = Rect2()
var step_history = []
var steps_since_turn = 0

func _init(starting_position, new_border):
	assert(new_border.has_point(starting_position))
	position = starting_position
	step_history.append(position)
	borders = new_border
	
func walk(steps):
	for step in steps:
		if randf() <= 0.2 or steps_since_turn >= rand_steps:
			change_direction()
		if step():
			step_history.append(position)
		else:
			change_direction()
	return step_history
	
func step():
	var target_position = position + direction
	if borders.has_point(target_position):
		steps_since_turn += 1
		position = target_position
		return true
	else:
		return false

func change_direction():
	steps_since_turn = 0
	var directions = DIRECTIONS.duplicate()
	directions.erase(direction)
	directions.shuffle()
	direction = directions.pop_front()
	while not borders.has_point(position + direction):
		direction = directions.pop_front()
	
	
	
	

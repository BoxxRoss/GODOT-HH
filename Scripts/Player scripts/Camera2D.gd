extends Camera2D


onready var noise = OpenSimplexNoise.new()
var noise_y = 0

func _ready():
	randomize()
	noise.seed = randi()
	noise.period = 4
	noise.octaves = 2
	
	zoom = Vector2(1.75,1.75)
	zoomout()

var spd = 0.1
var radius_req = 150
var timerss = 100


export var decay = 0.8  # How quickly the shaking stops [0, 1].
export var max_offset = Vector2(100, 75)  # Maximum hor/ver shake in pixels.
export var max_roll = 0.0  # Maximum rotation in radians (use sparingly).


var trauma = 0.0  # Current shake strength.
var trauma_power = 2  # Trauma exponent. Use [2, 3].

func zoomout():
	while zoom < Vector2(1.5,1.5):
		yield(get_tree().create_timer(0.025), "timeout")
		zoom.x = lerp(zoom.x,1.5,0.1)
		zoom.y = lerp(zoom.y,1.5,0.1)
		print(zoom)

func add_trauma_minor(amount):
	trauma = min(trauma + amount, 0.15)

func add_trauma(amount):
	trauma = min(trauma + amount, 1)
	
	
func _process(delta):
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()
	
	
	if self.position.x > 50:
		self.position.x = 50
	if self.position.x < -50:
		self.position.x = -50
		
	if self.position.y > 20:
		self.position.y = 20
	if self.position.y < -20:
		self.position.y = -20
	

func shake():
	var amount = pow(trauma, trauma_power)
	noise_y += 1
	rotation = max_roll * amount * noise.get_noise_2d(noise.seed, noise_y)
	offset.x = max_offset.x * amount * noise.get_noise_2d(noise.seed*2, noise_y)
	offset.y = max_offset.y * amount * noise.get_noise_2d(noise.seed*3, noise_y)



var min_zoom = Vector2(0.11, 0.11)

var zoomed = false
var zoom_speed = Vector2(0.5, 0.5)
var des_zoom = zoom



func _input(event):

	if event is InputEventMouseMotion:
		
		var delta = event.relative
		var mouse_position = get_global_mouse_position()
		var mouse_delta = mouse_position - global_position
		if (mouse_delta.length() >= radius_req):
			if timerss != 0:
				self.position += (mouse_delta / radius_req) * spd * delta
				timerss = timerss - 1
				print(self.position)
		else:
			self.position = Vector2(0,0)
			timerss = 100


func _on_KinematicBody2D_camera_zoom():
	if des_zoom > min_zoom and zoomed == false:
		zoomed = true
		des_zoom -= zoom_speed
		
			
		



func _on_KinematicBody2D_camera_zoom_out():
	des_zoom = Vector2(1.15, 1.15)
	
	zoomed = false





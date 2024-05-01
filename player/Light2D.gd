extends Light2D

var target : float = 20
var timer_checker : bool = false
var target_alpha = 1.00

func _ready():
	randomize()
	_on_Timer_timeout()

func _process(delta):
	if target != texture_scale:
		texture_scale = lerp(texture_scale,target,0.5)

		energy = lerp(energy, target_alpha,0.1)
		
	elif target == texture_scale and timer_checker:
		_get_target()
		
		timer_checker = false

func _get_target():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(20,22)
	var alpha = rand_range(0.7,0.9)
	target = num
	target_alpha = alpha
	


func _on_Timer_timeout():
	timer_checker = true
	var timer_time = rand_range(0.05,0.10)
	$Timer.wait_time = timer_time
	$Timer.start()

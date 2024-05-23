extends Control

onready var swarm = get_node("popup/SWARM_warning")
onready var popup = get_node("popup")
var checker = false
var display_time = 2.5

func _ready():
	popup.position = Vector2(-230,-400)
	
func _on_KinematicBody2D_stamina_change(stamina):
	$TextureProgress.value = stamina


func _physics_process(delta):
	if Global.swarm_just_started == true:
		swarm.text = "SWARM"
		swarm.rect_position.y = -15
		alert_to_swarm()
	
	if Global.swarm_just_ended == true:
		swarm.text = "SWARM\nOVER"
		swarm.rect_position.y = -65
		alert_to_swarm_end()

	
	if checker == false:
		change_colors()
		checker = true

	
func alert_to_swarm():
	
	
	popup.position = lerp(popup.position, Vector2(-230,-208),0.25)

	yield(get_tree().create_timer(display_time), "timeout")
	
	
	popup.position = lerp(popup.position, Vector2(-230,-400),0.17)
	
	Global.swarm_just_started = false
	
	
func alert_to_swarm_end():
	popup.position = lerp(popup.position, Vector2(-230,-130),0.25)
	
	yield(get_tree().create_timer(display_time), "timeout")
	popup.position = lerp(popup.position, Vector2(-230,-400),0.17)
	
	Global.swarm_just_ended = false

func change_colors():
	swarm.add_color_override("font_color", Color(0.5,0,0,1))
	swarm.add_color_override("font_outline_modulate", Color(1,1,1,1))
	swarm.add_color_override("font_color_shadow", Color(0,0,0,1))
		
	var color_change_time = 0.5
	yield(get_tree().create_timer(color_change_time), "timeout")
	
	swarm.add_color_override("font_color", Color(0.5,0,0,1))
	swarm.add_color_override("font_outline_modulate", Color(1,1,1,1))
	swarm.add_color_override("font_color_shadow", Color(1,0,0,1))
	yield(get_tree().create_timer(color_change_time), "timeout")
	checker = false

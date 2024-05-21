extends Control

onready var swarm = get_node("SWARM_warning")
onready var popup = get_node("popup")
var checker = false
var display_time = 2.5

func _ready():
	swarm.rect_position = Vector2(-368,-400)
	popup.position = Vector2(-230,-400)
	
func _on_KinematicBody2D_stamina_change(stamina):
	$TextureProgress.value = stamina


func _physics_process(delta):
	if Global.swarm_just_started == true:
		swarm.text = "SWARM"
		alert_to_swarm()
	
	if Global.swarm_just_ended == true:
		swarm.text = "SWARM\nOVER"
		alert_to_swarm_end()

	
	if checker == false:
		change_colors()
		checker = true

	
func alert_to_swarm():
	
	swarm.rect_position = lerp(swarm.rect_position, Vector2(-368,-250),0.2)
	popup.position = lerp(popup.position, Vector2(-230,-208),0.25)

	yield(get_tree().create_timer(display_time), "timeout")
	
	swarm.rect_position = lerp(swarm.rect_position, Vector2(-368,-400),0.2)
	popup.position = lerp(popup.position, Vector2(-230,-400),0.17)
	
	Global.swarm_just_started = false
	
	
func alert_to_swarm_end():
	
	swarm.rect_position = lerp(swarm.rect_position, Vector2(-368,-260),0.2)
	popup.position = lerp(popup.position, Vector2(-230,-130),0.25)
	
	yield(get_tree().create_timer(display_time), "timeout")
	
	swarm.rect_position = lerp(swarm.rect_position, Vector2(-368,-500),0.2)
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

extends KinematicBody2D

var rotation_speed = PI

var static_floor = preload("res://Projectile/lightnin/spray/eletric_floor_static.tscn")

var unaware = true

var current_charge = 0
var shocked = 0
var weak = 1
var current_flame_status = 0
var _being_ignited = false
var being_Vac = false
var stuck_in_vac_bomb = false
var pos_of_bomb 
onready var col = get_node("CollisionShape2D")

var four_coll_checker = 0
var damage_dealt
var hurt = false
var slowed = false
var motion = Vector2(0,0)

var damage: int
var enemy_cost : int
var speed : int
var ENEMYhealth : int

var enemy_is_horse = false
var enemy_is_horse_go = false

var ENEMYhealth_max : int
var max_speed : int

var num_of_walls = 0
var checker = 0

var speed_when_slowed : int

var checker_1 = true

var rand_x_patrol = rand_range(100,12000)
var rand_y_patrol = rand_range(100,6500)


var distracted = false
var distracted_by_deployed = 0



var target = null

func _ready():
	var Player = get_parent().get_node("KinematicBody2D")
	look_at(Player.position)
	


func find_target(distract_pow):
	distracted_by_deployed = distract_pow
	if distracted_by_deployed >= 50:
		distracted = true

func stuck_in_vac_bomb(bomb_pos):
	pos_of_bomb = bomb_pos
	stuck_in_vac_bomb = true
	
func unstuck_in_vac_bomb():
	stuck_in_vac_bomb = false

func be_slowed(concussive):
	var time_concussed = concussive
	slowed = true
	yield(get_tree().create_timer(time_concussed), "timeout")
	slowed = false

func Vac():
	if Global.enemies_in_Vac <= 1:
		being_Vac = true
		
func Vac_stop():
	being_Vac = false

func taking_damage(weapon_damage):
	hurt = true
	damage_dealt = weapon_damage
	
func taking_damage_stop():
	hurt = false

func shock(shock):
	shocked += shock
	
func being_ignited(ignite):
	_being_ignited = true
	current_flame_status += ignite
	
func not_being_ignited():
	_being_ignited = false
	
func enemy_death():
	queue_free()
	Global.enemy_score -= enemy_cost
	Global.score += 1
	Global.kill_count += 1

	if current_charge > 0:
		var static_insatnce = static_floor.instance()
		static_insatnce.global_position = self.global_position
		static_insatnce.global_rotation = self.global_rotation
		get_tree().get_root().call_deferred("add_child", static_insatnce)
		
func onhit(damage):
	ENEMYhealth -= damage

func shocked():
	speed = speed_when_slowed
	weak = 1.5
	
func static_floor_charge(static_floor):
	current_charge += static_floor

func enemy_captured():
	if being_Vac == true:
		queue_free()
		Global.score += 2
		Global.enemy_score -= enemy_cost
		Global.kill_count += 1
		
func _physics_process(delta):
	
	var Player = get_parent().get_node("KinematicBody2D")

	if Global.friend_ghost_has_died == true:
		distracted = false
	

	

	
	if checker_1 == true:
		ENEMYhealth_max = ENEMYhealth
		max_speed = speed
		speed_when_slowed = (speed/2.0)
		checker_1 = false
	if enemy_is_horse == true:
		motion = position.direction_to(Player.position) * speed
		look_at(Player.position)	
		enemy_is_horse = false
		enemy_is_horse_go = true

	if distracted == true:
		if enemy_is_horse == false:
			target = Global.friend_ghost_basic_pos
		else:
			target = Player.global_position
		
	if unaware == false:
		target = Player.global_position
	else:
		target = Vector2(rand_x_patrol,rand_y_patrol)
	
	shocked -= 0.01
	var MAX_LENGTH = 10000

	var vector_to_player = target - self.global_position
	var angle = vector_to_player.angle()
	var r = global_rotation
	var angle_delta = rotation_speed * delta
	angle = lerp_angle(r, angle, 1.0)
	angle = clamp(angle, r - angle_delta, r + angle_delta)
	global_rotation = angle
	

	if _being_ignited == true or current_flame_status > 0:
		ENEMYhealth -= current_flame_status/10
		current_flame_status -= 0.09

	
	if stuck_in_vac_bomb == true:
		global_position = lerp(global_position, pos_of_bomb, 0.1)

	if being_Vac == true:
		speed = 0
		
		randomize()
		var rand_struggle_x = rand_range(-5,5)
		var rand_struggle_y = rand_range(-5,5)
		col.scale.x = 0.01
		col.scale.y = 0.01
		
		global_position = lerp(global_position, get_global_mouse_position(), 0.05)
		
		global_position += Vector2(rand_struggle_x,rand_struggle_y)

		global_position = lerp(global_position, Global.player_global_position, 0.03)
		
	else:
		col.scale.x = 0.3
		col.scale.y = 0.3


	if current_flame_status <= 0:
		_being_ignited = false
		
	if ENEMYhealth <= 0:
		enemy_death()
	
	if shocked >= 15:
		shocked()

	if hurt == true:
		ENEMYhealth -= damage_dealt * weak
	
	if four_coll_checker == 4:
		$Icon.modulate.a = lerp($Icon.modulate.a, 0, .05)
	else:
		$Icon.modulate.a = lerp($Icon.modulate.a, 1, .05)
		
	if slowed == true:
		speed = lerp(speed, 33, .1)
		$Light2D.energy = lerp($Light2D.energy, 0.5, .03)
		
	else:
		speed = lerp(speed, max_speed, .05)
		$Light2D.energy = lerp($Light2D.energy, 0, .03)
	
	
	
	if enemy_is_horse_go == false:
		motion = position.direction_to(target) * speed
		motion = move_and_slide(motion)
	elif enemy_is_horse_go == true:
		motion = move_and_slide(motion)

extends KinematicBody2D

var static_floor = preload("res://Projectile/lightnin/spray/eletric_floor_static.tscn")

var four_coll_checker = 0
var damage_dealt
var hurt = false
var slowed = false
var motion = Vector2(0 , 0)
var speed = 100
var ENEMYhealthmax : int = 100
var ENEMYhealth = ENEMYhealthmax
var current_charge = 0
var shocked = 0
var weak = 1


func taking_damage(weapon_damage):
	hurt = true
	damage_dealt = weapon_damage

	
func taking_damage_stop():
	hurt = false

# current charge handels the properties of the static pool left behind when enemies die

func shock(shock):
	shocked += shock
	
func enemy_death():
	queue_free()
	Global.enemy_score -= 10
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
	speed = 50
	weak = 1.5
	
func static_floor_charge(static_floor):
	current_charge += static_floor

	
func _physics_process(delta):
	shocked -= 0.01
	
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
	

	var Player = get_parent().get_node("KinematicBody2D")
	
	motion = position.direction_to(Player.position) * speed
	motion = move_and_slide(motion)
	look_at(Player.position)

	
	
	if slowed == true:
		speed = 50
		$Light2D.energy = lerp($Light2D.energy, 1.2, .03)
	else:
		speed = 100
		$Light2D.energy = lerp($Light2D.energy, 0, .03)







func _on_Area2D_body_entered(body):
	if body is TileMap:
		slowed = true
		
		
	if "KinematicBody2D" in body.name:
		enemy_death()
		Global.score -= 1
		body.take_a_hit()


func _on_Area2D_body_exited(body):
	if body is TileMap:
		slowed = false




func _on_Area2Dfront_body_entered(body):
	if body is TileMap:
		four_coll_checker += 1

func _on_Area2Dfront_body_exited(body):
	if body is TileMap:
		four_coll_checker -= 1

func _on_Area2Dleft_body_entered(body):
	if body is TileMap:
		four_coll_checker += 1

func _on_Area2Dleft_body_exited(body):
	if body is TileMap:
		four_coll_checker -= 1

func _on_Area2Dright_body_entered(body):
	if body is TileMap:
		four_coll_checker += 1

func _on_Area2Dright_body_exited(body):
	if body is TileMap:
		four_coll_checker -= 1

func _on_Area2Dback_body_entered(body):
	if body is TileMap:
		four_coll_checker += 1
		
func _on_Area2Dback_body_exited(body):
	if body is TileMap:
		four_coll_checker -= 1

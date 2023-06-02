extends "res://Rooms/menu_rooms/weapon_upgrades/weapon_upgrade_tree.gd"

onready var weapon_description = get_node("description_of_weapon")
onready var cost_of_weapon = get_node("cost_of_weapon")

var upgrade_initatied = 0

var teir_1_bought = false
var teir_2_bought = false
var teir_3_bought = false
var teir_4_bought = false
var teir_5_bought = false

var checker_move = true

func _ready() -> void:
	weapon_chosen = 1
	upgrade_to_be_shown = 0

func show_upgrade(upgrade_to_be_shown):
	cost_of_weapon.rect_position = lerp(cost_of_weapon.rect_position, Vector2(256,512), 0.1)
	weapon_description.rect_position = lerp(weapon_description.rect_position, Vector2(768,512), 0.1)
	if upgrade_to_be_shown == 1:
		cost_of_weapon.text = "cost1"
	if upgrade_to_be_shown == 2:
		cost_of_weapon.text = "cost2"
	if upgrade_to_be_shown == 3:
		cost_of_weapon.text = "cost3"
	if upgrade_to_be_shown == 4:
		cost_of_weapon.text = "cost4"
	if upgrade_to_be_shown == 5:
		cost_of_weapon.text = "cost5"
	if upgrade_to_be_shown == 6:
		cost_of_weapon.text = "cost6"
	if upgrade_to_be_shown == 7:
		cost_of_weapon.text = "cost7"
	if upgrade_to_be_shown == 8:
		cost_of_weapon.text = "cost8"
	if upgrade_to_be_shown == 9:
		cost_of_weapon.text = "cost9"
	if upgrade_to_be_shown == 10:
		cost_of_weapon.text = "cost10"
	if upgrade_to_be_shown == 11:
		cost_of_weapon.text = "cost11"
	if upgrade_to_be_shown == 12:
		cost_of_weapon.text = "cost12"
	if upgrade_to_be_shown == 13:
		cost_of_weapon.text = "cost13"
	if upgrade_to_be_shown == 14:
		cost_of_weapon.text = "cost14"
	if upgrade_to_be_shown == 15:
		cost_of_weapon.text = "cost15"
		
func hide_upgrade():

	cost_of_weapon.rect_position = lerp(cost_of_weapon.rect_position, Vector2(256,1280), 0.15)
	weapon_description.rect_position = lerp(weapon_description.rect_position, Vector2(768,1280), 0.15)

func _process(delta):
	if upgrade_to_be_shown == 0:
		hide_upgrade()
	
	if upgrade1T1_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U1T1_buff()
	else:
		remove_U1T1_buff()
		
	if upgrade2T1_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U2T1_buff()
	else:
		remove_U2T1_buff()
		
	if upgrade3T1_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U3T1_buff()
	else:
		remove_U3T1_buff()



	if upgrade1T2_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U1T2_buff()
	else:
		remove_U1T2_buff()
		
	if upgrade2T2_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U2T2_buff()
	else:
		remove_U2T2_buff()
		
	if upgrade3T2_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U3T2_buff()
	else:
		remove_U3T2_buff()
		
		
		
	if upgrade1T3_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U1T3_buff()
	else:
		remove_U1T3_buff()
		
	if upgrade2T3_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U2T3_buff()
	else:
		remove_U2T3_buff()
		
	if upgrade3T3_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U3T3_buff()
	else:
		remove_U3T3_buff()
		
		
		
	if upgrade1T4_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U1T4_buff()
	else:
		remove_U1T4_buff()
		
	if upgrade2T4_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U2T4_buff()
	else:
		remove_U2T4_buff()
		
	if upgrade3T4_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U3T4_buff()
	else:
		remove_U3T4_buff()
		
		
		
	if upgrade1T5_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U1T5_buff()
	else:
		remove_U1T5_buff()
		
	if upgrade2T5_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U2T5_buff()
	else:
		remove_U2T5_buff()
		
	if upgrade3T5_pressed == true:
		show_upgrade(upgrade_to_be_shown)
		apply_U3T5_buff()
	else:
		remove_U3T5_buff()
		
	if teir_1_bought == true:
		$buy_teir_one.rect_position = lerp($buy_teir_one.rect_position, Vector2(256,-256), 0.008)

	if teir_2_bought == true:
		$buy_teir_two.rect_position = lerp($buy_teir_two.rect_position, Vector2(416,-256), 0.008)

	if teir_3_bought == true:
		$buy_teir_three.rect_position = lerp($buy_teir_three.rect_position, Vector2(576,-256), 0.008)
		
	if teir_4_bought == true:
		$buy_teir_four.rect_position = lerp($buy_teir_four.rect_position, Vector2(736,-256), 0.008)
		
	if teir_5_bought == true:
		$buy_teir_five.rect_position = lerp($buy_teir_five.rect_position, Vector2(896,-256), 0.008)
		
func apply_U1T1_buff():
	Global.upgrade1 = true
func remove_U1T1_buff():
	Global.upgrade1 = false
	
func apply_U2T1_buff():
	Global.upgrade2 = true
func remove_U2T1_buff():
	Global.upgrade2 = false
	
func apply_U3T1_buff():
	Global.upgrade3 = true
func remove_U3T1_buff():
	Global.upgrade3 = false

func apply_U1T2_buff():
	Global.upgrade4 = true
func remove_U1T2_buff():
	Global.upgrade4 = false

func apply_U2T2_buff():
	Global.upgrade5 = true
func remove_U2T2_buff():
	Global.upgrade5 = false
	
func apply_U3T2_buff():
	Global.upgrade6 = true
func remove_U3T2_buff():
	Global.upgrade6 = false
	
func apply_U1T3_buff():
	Global.upgrade7 = true
func remove_U1T3_buff():
	Global.upgrade7 = false
	
func apply_U2T3_buff():
	Global.upgrade8 = true
func remove_U2T3_buff():
	Global.upgrade8 = false

func apply_U3T3_buff():
	Global.upgrade9 = true
func remove_U3T3_buff():
	Global.upgrade9 = false
	
func apply_U1T4_buff():
	Global.upgrade10 = true
func remove_U1T4_buff():
	Global.upgrade10 = false
	
func apply_U2T4_buff():
	Global.upgrade11 = true
func remove_U2T4_buff():
	Global.upgrade11 = false
	
func apply_U3T4_buff():
	Global.upgrade12 = true
func remove_U3T4_buff():
	Global.upgrade12 = false
	
func apply_U1T5_buff():
	Global.upgrade13 = true
func remove_U1T5_buff():
	Global.upgrade13 = false
	
func apply_U2T5_buff():
	Global.upgrade14 = true
func remove_U2T5_buff():
	Global.upgrade14 = false
	
func apply_U3T5_buff():
	Global.upgrade15 = true
func remove_U3T5_buff():
	Global.upgrade15 = false
	
func _on_buy_teir_one_pressed():
	if Global.loot_soul >= 0:
		teir_1_bought = true
		$teir1/upgrade1T1.disabled = false
		$teir1/upgrade2T1.disabled = false
		$teir1/upgrade3T1.disabled = false
func _on_buy_teir_two_pressed():
	if Global.loot_soul >= 0 and teir_1_bought:
		teir_2_bought = true
		$teir2/upgrade1T2.disabled = false
		$teir2/upgrade2T2.disabled = false
		$teir2/upgrade3T2.disabled = false
func _on_buy_teir_three_pressed():
	if Global.loot_soul >= 0 and teir_1_bought and teir_2_bought:
		teir_3_bought = true
		$teir3/upgrade1T3.disabled = false
		$teir3/upgrade2T3.disabled = false
		$teir3/upgrade3T3.disabled = false
func _on_buy_teir_four_pressed():
	if Global.loot_soul >= 0 and teir_1_bought and teir_2_bought and teir_3_bought:
		teir_4_bought = true
		$teir4/upgrade1T4.disabled = false
		$teir4/upgrade2T4.disabled = false
		$teir4/upgrade3T4.disabled = false
func _on_buy_teir_five_pressed():
	if Global.loot_soul >= 0 and teir_1_bought and teir_2_bought and teir_3_bought and teir_4_bought:
		teir_5_bought = true
		$teir5/upgrade1T5.disabled = false
		$teir5/upgrade2T5.disabled = false
		$teir5/upgrade3T5.disabled = false

extends Control

@onready var upgrades = get_node("/root/Upgrades")
@onready var shiptext1 = $PanelContainer/HBoxContainer/VBoxContainer/ShipUpgrade1/ShipText1
@onready var shiptext2 = $PanelContainer/HBoxContainer/VBoxContainer/ShipUpgrade2/ShipText2
@onready var lasertext1 = $PanelContainer/HBoxContainer/VBoxContainer2/LaserUpgrade1/LaserText1
@onready var lasertext2 = $PanelContainer/HBoxContainer/VBoxContainer2/LaserUpgrade2/LaserText2
@onready var shipbutton1 = $PanelContainer/HBoxContainer/VBoxContainer/ShipUpgrade1
@onready var shipbutton2 = $PanelContainer/HBoxContainer/VBoxContainer/ShipUpgrade2
@onready var laserbutton1 = $PanelContainer/HBoxContainer/VBoxContainer2/LaserUpgrade1
@onready var laserbutton2 = $PanelContainer/HBoxContainer/VBoxContainer2/LaserUpgrade2

var level1upgradeprice = 50
var level2upgradeprice = 100

signal menu_closed

# Called when the node enters the scene tree for the first time.
func _ready():
	shiptext1.text = "Price: "+str(level1upgradeprice)+" credits
Acquire a faster ship"
	shiptext2.text = "Price: "+str(level2upgradeprice)+" credits
Acquire the coolest and 
fastest ship on Super Earth!"
	lasertext1.text = "Price: "+str(level1upgradeprice)+" credits
Make your laser deal
more damage"
	lasertext2.text = "Price: "+str(level2upgradeprice)+" credits
Make your laser do even 
more damage"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_ship_upgrade_1_pressed():
	if upgrades.credits >= level1upgradeprice:
		upgrades.credits -= level1upgradeprice
		upgrades.ship_upgrade_1()
		shipbutton1.disabled = true
		shiptext1.text = "PURCHASED"



func _on_ship_upgrade_2_pressed():
	if upgrades.credits >= level2upgradeprice:
		upgrades.credits -= level2upgradeprice
		upgrades.ship_upgrade_2()
		shipbutton2.disabled = true
		shiptext2.text = "PURCHASED"



func _on_laser_upgrade_1_pressed():
	if upgrades.credits >= level1upgradeprice:
		upgrades.credits -= level1upgradeprice
		upgrades.laser_upgrade_1()
		laserbutton1.disabled = true
		lasertext1.text = "PURCHASED"



func _on_laser_upgrade_2_pressed():
	if upgrades.credits >= level2upgradeprice:
		upgrades.credits -= level2upgradeprice
		upgrades.laser_upgrade_2()
		laserbutton2.disabled = true
		lasertext2.text = "PURCHASED"




func _on_close_button_pressed():
	emit_signal("menu_closed")
	self.hide()

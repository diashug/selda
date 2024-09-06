extends CanvasLayer

class_name InventoryUI

@onready var grid_container: GridContainer  = $MarginContainer/NinePatchRect/MarginContainer/VBoxContainer/GridContainer
const INVENTORY_SLOT_SCENE = preload("res://Scenes/UI/inventory_slot.tscn")

@export var size: int = 8
@export var columns: int = 4

func _ready():
	grid_container.columns = columns
	
	for i in size:
		var inventory_slot = INVENTORY_SLOT_SCENE.instantiate()
		grid_container.add_child(inventory_slot)

func toggle():
	visible = !visible

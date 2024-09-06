extends Node

class_name Inventory

@onready var inventory_ui: InventoryUI = $"../InventoryUI"

func _input(_event):
	if Input.is_action_pressed("toggle_inventory"):
		inventory_ui.toggle()

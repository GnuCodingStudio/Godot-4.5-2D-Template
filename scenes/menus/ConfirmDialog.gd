@tool
class_name ConfirmDialog
extends Panel

@export var text: String
@export_category("Buttons")
@export var confirmButtonText: String
@export var cancelButtonText: String

signal on_confirm()
signal on_cancel()


@onready var text_label: Label = %TextLabel
@onready var confirm_button: Button = %ConfirmButton
@onready var cancel_button: Button = %CancelButton


func _ready() -> void:
	text_label.text = text
	confirm_button.text = confirmButtonText
	cancel_button.text = cancelButtonText


func pop_in() -> void:
	super.show()
	confirm_button.grab_focus()


func _on_confirm_button_pressed() -> void:
	hide()
	on_confirm.emit()


func _on_cancel_button_pressed() -> void:
	hide()
	on_cancel.emit()

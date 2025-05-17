extends CanvasLayer



func _on_corner_button_pressed():
	$Pause.visible = !$Pause.visible


func _on_settings_pressed():
	$Pause/SettingsMenu.visible = !$Pause/SettingsMenu.visible

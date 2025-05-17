extends Button
func _on_pressed() -> void:
	var name = $"../NameRelated/Name yo save!".text
	var chapter = $"../ChapterRelated/OptionButton".selected

	
	var errChapter = false
	var errName = false
#region Name Button Region
	if $"../NameRelated/Name yo save!".text == "":
		$"../NameRelated/Error".visible = true
		errName = true
	else:
		$"../NameRelated/Error".visible = false
		errName = false
#endregion
#region Chap# Region
	if $"../ChapterRelated/OptionButton".selected == -1:
		$"../ChapterRelated/Error".visible = true
		errChapter = true
	else:
		$"../ChapterRelated/Error".visible = false
		errChapter = false
#endregion
	if errChapter == false and errName == false:
		var file_name = "user://%s_chapter_%d.txt" % [name, chapter]
		var file_exist = FileAccess.open(file_name, FileAccess.READ) 
		var file = FileAccess.open(file_name, FileAccess.WRITE)

		if file_exist:
			print("The file \"" + $"../NameRelated/Name yo save!".text + "\" Already exists! See our help page for more details. ERR XXX")
			print(file_name)
			$"../Feedback bad".visible = true
			$"../Feedback good".visible = false 
			file.close()
		
		
		else:
			file.store_string("file tyedcfkjdnfjcndfv")
			print("File created sucessfuly! The name is: " + $"../NameRelated/Name yo save!".text + " . Note that there may be another problem with you file. If it does not work as expected, see our help page. ERR XXX")
			$"../Feedback good".visible = true
			$"../Feedback bad".visible = false
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file ("res://Gameinterface.tscn")
			
			
			file.close()
	

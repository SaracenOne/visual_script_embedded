extends EditorPlugin
tool

var editor_interface = null

func get_name(): 
	return "VisualScriptEmbedded"
	
func _enter_tree():
	editor_interface = get_editor_interface()
	
	add_custom_type("VisualScriptEmbedded", "VisualScript", preload("visual_script_embedded.gd"), editor_interface.get_base_control().get_icon("VisualScript", "EditorIcons"))

func _exit_tree():
	remove_custom_type("VisualScriptEmbedded")
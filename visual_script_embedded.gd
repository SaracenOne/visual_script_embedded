extends VisualScript
tool

const visual_script_function_call_safe_const = preload("visual_script_function_call_safe.gd")

func _init():
	pass

func get_node_valid(p_node):
	if p_node is VisualScriptComment:
		return p_node
	elif p_node is VisualScriptFunction:
		return p_node
	elif p_node is VisualScriptFunctionCall:
		if p_node is visual_script_function_call_safe_const:
			return p_node
		else:
			return visual_script_function_call_safe_const.new()
	elif p_node is VisualScriptCondition:
		return p_node
	elif p_node is VisualScriptMathConstant:
		return p_node
	elif p_node is VisualScriptOperator:
		return p_node
	elif p_node is VisualScriptSwitch:
		return p_node
	elif p_node is VisualScriptSubCall:
		return p_node
	elif p_node is VisualScriptWhile:
		return p_node
	
	return null

func add_function(p_name):
	var object_method_list = ClassDB.class_get_method_list("Object", true)
	
	for object_method_name in object_method_list:
		if p_name == object_method_name.name:
			return
	
	.add_function(p_name)
	
func add_node(p_func, p_id, p_node, p_position=Vector2(0, 0)):
	var node = get_node_valid(p_node)
	if node:
		.add_node(p_func, p_id, node, p_position)

func set_instance_base_type(p_type):
	.set_instance_base_type("Object")
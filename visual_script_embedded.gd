extends VisualScript
tool

func is_node_valid(p_node):
	if p_node is VisualScriptComment:
		return true
	elif p_node is VisualScriptCondition:
		return true
	elif p_node is VisualScriptMathConstant:
		return true
	elif p_node is VisualScriptOperator:
		return true
	elif p_node is VisualScriptSwitch:
		return true
	elif p_node is VisualScriptSubCall:
		return true
	elif p_node is VisualScriptWhile:
		return true
	
	return false

func add_function(p_name):
	var object_method_list = ClassDB.class_get_method_list("Object", true)
	
	for object_method_name in object_method_list:
		if p_name == object_method_name.name:
			return
	
	.add_function(p_name)
	
func add_node(p_func, p_id, p_node, p_position=Vector2(0, 0)):
	if is_node_valid(p_node):
		.add_node(p_func, p_id, p_node, p_position)

func set_instance_base_type(p_type):
	.set_instance_base_type("Object")
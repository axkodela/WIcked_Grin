extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_key_pressed(KEY_I):
		var val=$f_ca01.get("blend_shapes/Key 1")
		$f_ca01.set("blend_shapes/Key 1",val+0.1)
		if val>0.9:
			$f_ca01.set("blend_shapes/Key 1",0)
			
	elif Input.is_key_pressed(KEY_J):
		var val=$f_ca01.get("blend_shapes/Key 1")
		$f_ca01.set("blend_shapes/Key 1",val-0.1)
		if val<0:
			$f_ca01.set("blend_shapes/Key 1",1)

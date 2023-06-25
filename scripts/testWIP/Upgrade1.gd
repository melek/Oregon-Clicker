extends Control

@onready var anim = $AnimationPlayer

func mouseEntered():
	anim.play("expand")


func mouseExited():
	anim.play("retract")

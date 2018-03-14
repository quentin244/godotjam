extends KinematicBody2D

signal speed_updated
signal state_changed
signal direction_changed

enum STATES { SPAWN, IDLE, BUMP }
var state = null

func _ready():
	$Health.connect('health_changed', self, '_on_Health_health_changed')


func _on_Weapon_attack_finished():
	print('hey!')
	_change_state(IDLE)

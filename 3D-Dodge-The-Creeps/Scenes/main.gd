extends Node

@export var mob_scene: PackedScene


func _on_mob_timer_timeout():
	#Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()
	
	#Choose a random location on the SpawnPath, store it in the SpawnLocation node
	var mob_spawn_location=$SpawnPath/SpawnLocation
	#And give it a randon offset
	mob_spawn_location.progress_ratio=randf()
	
	var player_position=$Player.position
	mob.initialize(mob_spawn_location.position, player_position)
	
	#Spawn the mob by adding it to the Main scene
	add_child(mob)

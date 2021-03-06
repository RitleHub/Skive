extends Node


signal scene_changed(scene_name, arr)  # Setting signal to change scene.

export (String) var scene_name = ''  # Picking a scene through the script.


func _on_ClientButton_pressed():
	# Emmiting the signal upon click.
	scene_name = 'SearchHosts'
	emit_signal('scene_changed', scene_name, [])  


func request_scene_change(ip: String):
	# Emitting the signal upon click of a generated button in runtime.
	# This is being used by Discover.gd 
	emit_signal('scene_changed', scene_name, [ip])


func _on_ServerButton_pressed():
	# Emmiting the signal upon click.
	scene_name = 'Host'
	emit_signal('scene_changed', scene_name, [])  


func _on_Back_pressed():
	$NetworkSetup.on_Back_pressed()  # Telling the server we are disconnnecting
	scene_name = 'Main'
	emit_signal('scene_changed', scene_name, [])  


func _on_Back2_pressed():
	scene_name = 'Main'
	emit_signal('scene_changed', scene_name, [])  


func _on_QuitButton_pressed():
	# Letting everyone know the server is shutting down.
	$NetworkSetup.on_Back_pressed()  

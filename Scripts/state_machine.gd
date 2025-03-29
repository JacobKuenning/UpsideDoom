extends Node

@export var initial_state : State

var current_state : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child #adding the state to the dictionary
			child.Transitioned.connect(on_child_transition) #when Transitioned is called on a state, it runs the function "on_child_transition"
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state
			
func _process(delta):
	if current_state:
		current_state.update(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)
		
func on_child_transition(state, new_state_name): #when transitioning states
	if state != current_state: #if the state that called this is the current state, ignore
		return
	
	var new_state = states.get(new_state_name.to_lower()) #setting the new state variable to the state in the dictionary with the same name
	if !new_state:
		return
		
	if current_state: #if there is a current state, exit it and enter the new state
		current_state.exit()
	
	new_state.enter()
	current_state = new_state	

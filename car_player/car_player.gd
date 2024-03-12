extends Area2D

#car movement speed and interpolation speed
var move_speed:int = 25 #movement speed of the car when the screen is touched
var interp_speed:float=8.0 #controlling how quickly the car moves horizontally
var target_position: Vector2 #the target position towards which the car will move
var posx_left_boundary #left map boundary for player car
var posx_right_boundary #right map boundary for player car

# Called when the node enters the scene tree for the first time.
func _ready():
	#set the target position to the current position of our car
	target_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#smoothly move the car towards the target position
	position.x = lerp(position.x,target_position.x,interp_speed*delta)
	
func _input(event):	
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		print_debug("test")
		#check for touch or mouse event
		if event.pressed:
			#get screen width
			var screen_width = get_viewport_rect().size.x
			#check if click is on the left or right hand side
			if event.position.x < screen_width/2:
				target_position.x -= move_speed
			else:
				target_position.x += move_speed
			
			

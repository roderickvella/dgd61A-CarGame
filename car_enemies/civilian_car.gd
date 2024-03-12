extends EnemyCar


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready() #call the ready function in the base class
	set_vechile_type(CIVILIAN)
	speed = randi_range(190,200) #civilian car has access to starting random speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)  #call the process function in the base class


func _on_area_2d_area_entered(area):
	hit.emit(self)

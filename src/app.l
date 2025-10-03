app
	// Called when the game starts
	start
		graphics.drawingOrder = ItemsDrawnFirstWillBeInTheBack
		Menu()
		
	// Called on every frame (30 times per second)
	tick
		players.each.tick
		
Player
	Vector2 pos = IntVector2.horizontalDirections[index] * {690,265}
	
	// Called on every frame (30 times per second)
	tick
		// Draw video (we always show a video feed for each player)
		float radius = 255
		drawCircle pos, size:radius*2, outlineColor:color, outlineWidth:12
		drawVideo me, pos, size:radius*2-75, shape:Circle

		// Draw score
		Vector2 scorePos = pos + math.getVectorForAngle(.125 turns)*radius
		drawCircle scorePos, color:Black, outlineColor:color, size:60
		drawText score, scorePos, size:31

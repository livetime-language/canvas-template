app
	// Called when the game starts
	start
		graphics.drawingOrder = LastDrawnWillBeInFront
		Menu()
		
	// Called on every frame (30 times per second)
	tick
		drawImage LiveTimeLogo, {0,-55}
		drawText "Hello World", {0, 55}
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
		Vector2 scorePos = pos + math.getVectorForAngle(.125 turn)*radius
		drawCircle scorePos, color:Black, outlineColor:color, size:60
		drawText score, scorePos, size:31

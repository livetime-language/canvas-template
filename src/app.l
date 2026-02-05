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
	
	onTouchHover: Touch touch
		print "{this} hovers at {touch.position}"
	
	onTouchDown: Touch touch
		print "{this} clicks at {touch.position}"
	
	onTouchDrag: Touch touch
		print "{this} drags to {touch.position}"
	
	onTouchUp: Touch touch
		print "{this} releases at {touch.position}"

	onKeyDown: Key key, string character
		print "{this} presses {key} ({character})"

	onKeyUp: Key key
		print "{this} releases {key}"
		
	tick
		if gameController.leftStick.magnitude > .1
			print "{this} holds their left stick in this direction: {gameController.leftStick}"

		if gameController.a.wasJustPressed
			print "{this} just pressed the A button on their game controller"

		// Draw the player's video feed in a circle
		float radius = 255
		drawCircle pos, size:radius*2, outlineColor:color, outlineWidth:12
		drawVideo me, pos, size:radius*2-75, shape:Circle

		// Draw the player's score
		Vector2 scorePos = pos + math.getVectorForAngle(.125 turn)*radius
		drawCircle scorePos, color:Black, outlineColor:color, size:60
		drawText score, scorePos, size:31
		
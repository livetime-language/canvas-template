app
	// Called when the game starts
	start
		graphics.drawingOrder = LastDrawnWillBeInFront
		Menu()
		
	// Called on every frame (30 times per second)
	tick
		drawImage LiveTimeLogo, {0, -120}
		drawText "LiveTime Game Template", {0, 0}

		drawStandardButton "Start", {0, 120}
			print "Start button clicked by {touch.by}"

		players.each.tick
		
Player
	Vector2 pos = IntVector2.horizontalDirections[index] * {690,265}
	
	onTouchHover: Touch touch
		print "{this} hovered at {touch.position}" type:Event
	
	onTouchDown: Touch touch
		print "{this} clicked at {touch.position}" type:Event
	
	onTouchDrag: Touch touch
		print "{this} draged to {touch.position}" type:Event
	
	onTouchUp: Touch touch
		print "{this} released at {touch.position}" type:Event

	onKeyDown: Key key, string character
		print "{this} pressed {key} ({character})" type:Event

	onKeyUp: Key key
		print "{this} released {key}" type:Event
		
	tick
		if gameController.leftStick.magnitude > .1
			print "{this} moved left stick to {gameController.leftStick}" type:Event

		if gameController.a.wasJustPressed
			print "{this} just pressed the A button on their game controller" type:Event

		// Draw the player's video feed in a circle
		float radius = 255
		drawCircle pos, size:radius*2, outlineColor:color, outlineWidth:12
		drawVideo me, pos, size:radius*2-75, shape:Circle

		// Draw the player's score
		Vector2 scorePos = pos + math.getVectorForAngle(.125 turn)*radius
		drawCircle scorePos, color:Black, outlineColor:color, size:60
		drawText score, scorePos, size:31
		
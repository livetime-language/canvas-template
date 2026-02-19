app
	Player currentPlayer

	// Called when the game starts
	start
		Menu()
		graphics.drawingOrder = LastDrawnWillBeInFront
		currentPlayer = players.random
		
	// Called on every frame (30 times per second)
	tick
		drawImage LiveTimeLogo, {0, -180}
		drawText "LiveTime Game Template", {0, 0}

		drawStandardButton "Swap places", {0, 128}
			players[0].pos swapWith players[1].pos
			print "Player positions swapped by {touch.by}"

		players.each.tick
		
Player
	const speed = 16

	Vector2 videoPos = {IntVector2.horizontalDirections[index].x * 690, 0}
	Vector2 pos = {IntVector2.horizontalDirections[index].x * 128, -128}
	
	onTouchHover: Touch touch
		print "Hover at {touch.position} by {this}"
	
	onTouchDown: Touch touch
		print "Click at {touch.position} by {this}"
	
	onTouchDrag: Touch touch
		print "Drag to {touch.position} by {this}"
	
	onTouchUp: Touch touch
		print "Release at {touch.position} by {this}"

	onKeyDown: Key key, string character
		print "{key} ({character}) pressed by {this}"

	onKeyUp: Key key
		print "{key} released by {this}"

	// Called on every frame (30 times per second) if a game controller is connected
	onGameController: GameController controller
		pos += controller.leftStick * speed

		if controller.A.wasJustPressed
			print "Button {controller.A.name} just pressed by {this}"
		
	tick
		drawCircle pos, color, size:64

		// Draw the player's video feed in a circle
		float radius = 255
		Color outlineColor = app.currentPlayer == this ? color : darkColor
		drawCircle videoPos, size:radius*2, outlineColor, outlineWidth:12
		drawVideo me, videoPos, size:radius*2-75, shape:Circle

		// Draw the player's score
		Vector2 scorePos = videoPos + math.getVectorForAngle(.125 turn)*radius
		drawCircle scorePos, color:Black, outlineColor, size:60
		drawText score, scorePos, size:31
		
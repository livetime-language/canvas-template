tests
	swapPlacesButtonShouldSwapPlayerPositions
		let prevBluePlayerPos = bluePlayer.pos
		let prevRedPlayerPos = redPlayer.pos
		click {0, 128} by bluePlayer
		expect bluePlayer.pos == prevRedPlayerPos
		expect redPlayer.pos == prevBluePlayerPos
		
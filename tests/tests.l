tests
	swapPlacesButtonShouldSwapPlayerPositions
		let prevBluePlayerPos = players[0].pos
		let prevRedPlayerPos = players[1].pos
		click {0, 128} by players[0]
		expect players[0].pos == prevRedPlayerPos
		expect players[1].pos == prevBluePlayerPos
		
tests
	test Sample: Swap button should swap player positions
		let prevPlayer0Pos = players[0].pos
		let prevPlayer1Pos = players[1].pos
		click {0, 128} by players[0]
		expect players[0].pos == prevPlayer1Pos
		expect players[1].pos == prevPlayer0Pos
		
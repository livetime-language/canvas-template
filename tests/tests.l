tests
	test Sample: Swap button should swap player positions
		let prevPlayer0Pos = input.players[0].pos
		let prevPlayer1Pos = input.players[1].pos
		click {0, 128} by input.players[0]
		expect input.players[0].pos == prevPlayer1Pos
		expect input.players[1].pos == prevPlayer0Pos
		
class Level
	constructor:->
		@entities = new Array()
		@layer = {"entities":new Layer("game", WIDTH, HEIGHT, 3)}
		@entities.push(new Cloud())
	
	tick:->
		
		
	render:->
		for i in [0...@entities.length]
			@entities[i].render(@layer["entities"].getContext())
		@layer["entities"].render()
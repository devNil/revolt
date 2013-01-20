class Level
	constructor:->
		@entities = new Array()
		@layer = {"entities":new Layer("game", WIDTH, HEIGHT, 3)}
		cloud = new Cloud()
		cloud.setPosition(220, 40)

		@entities.push(new Cloud())
		@entities.push(cloud)
	
	
	tick:->
		
	render:->
		for i in [0...@entities.length]
			@entities[i].render(@layer["entities"].getContext())
		@layer["entities"].render()

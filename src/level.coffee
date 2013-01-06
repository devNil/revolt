class Level
	constructor:->
		@entities = new Array()
		@layer = ["entities", new Layer("game", Game.WIDTH, Game.WIDTH, 1)]
	
	tick:->
		
		
	render:->
		@layer["entities"].render()
#main-method
$ =>
	@WIDTH = 640
	@HEIGHT = 480
	
	prelude = new Prelude()
	
	@SPRITE = new Spritesheet(prelude.addImage("img/sprites.png"), 8)
	@GAME = new Game()
	
	prelude.setOnCompletionTask(@GAME.render)
	prelude.start()

#Game Class
class Game
	
	constructor:->
		@entitiesLayer = new Layer("screen", 640, 480, 4)
		
		@map = new Layer("screen", 640, 480, 10)
		
		@entities = new Array()
		#@output = new Output()
		
		
		
		@data = [
			-1,-1,-1,-1,-1,-1,-1,-1
			,-1,-1,-1,-1,-1,-1,-1,-1
			,-1,-1,-1,-1,-1,-1,-1,-1
			,-1,-1,-1,-1,-1,-1,-1,-1
			,0,0,0,0,0,0,0,0
			,1,1,1,1,1,1,1,1
		]
		
		@canvas = document.getElementById("screen")
		@ctx = @canvas.getContext("2d")
	
	#render-method
	render:=>
		@map.clear()
		
		for y in [0...6]
			for x in [0...8]
				index = x + y * 8
				if @data[index] is -1 then continue
				SPRITE.draw(@map.getContext(), x*8, y*8, @data[index])
		
		@map.render()
		
		window.requestAnimFrame(@render)
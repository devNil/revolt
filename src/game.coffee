#main-method
$ =>
	prelude = new Prelude()
	
	@SPRITE = prelude.addImage("img/sprites.png")
	@GAME = new Game()
	
	prelude.setOnCompletionTask(@GAME.init)
	prelude.start()

#Game Class
class Game
	
	WIDTH = 640
	HEIGHT = 480
	SCALE = 4
	
	constructor:->
		@running = false;
		@level = new Level()
	
	init:=>
		@canvas = document.getElementById("game")
		@ctx = @canvas.getContext("2d")
		@ctx.drawImage(SPRITE, 0, 0)
		@start()
		
	
	start:->
		@running = true
		@run()
		
	
	#tick-method
	tick:->
		
	
	#render-method
	render:->
		
		
	run:=>
		@tick() if @running
		@render()
		window.requestAnimFrame(@run)
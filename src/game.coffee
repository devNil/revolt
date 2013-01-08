#main-method
$ =>
	@WIDTH = 640
	@HEIGHT = 480
	
	prelude = new Prelude()
	
	@SPRITE = new Spritesheet(prelude.addImage("img/sprites.png"), 8)
	@GAME = new Game()
	
	prelude.setOnCompletionTask(@GAME.init)
	prelude.start()

#Game Class
class Game
	
	constructor:->
		@running = false;
		@level = new Level()
	
	init:=>
		@canvas = document.getElementById("game")
		@ctx = @canvas.getContext("2d")
		#@ctx.drawImage(SPRITE, 0, 0)
		@start()
		
	
	start:->
		@running = true
		@run()
		
	
	#tick-method
	tick:->
		@level.tick()
		
	
	#render-method
	render:->
		@level.render()
		
		
	run:=>
		@tick() if @running
		@render()
		window.requestAnimFrame(@run)
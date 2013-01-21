#main-method
$ =>
	@WIDTH = 640
	@HEIGHT = 480
	@SCALE = 10	
	prelude = new Prelude()
	
	@SPRITE = new Spritesheet(prelude.addImage("img/sprites.png"), 8)
	@GAME = new Game()
	
	@INFO = new Infobar()
	@INFO.setText("no entity is selected")
	
	@INPUT = new InputHandler()
	
	bar = document.getElementById("actionbar").getElementsByTagName("button")
	for i in [0...bar.length]
		$(bar[i]).click(->GAME.add(this))
	
	prelude.setOnCompletionTask(@GAME.render)
	prelude.start()

#Game Class
class Game
	constructor:->
		@screen = new Layer("screen", 640, 480, 1)
		@entitiesLayer = new Layer("screen", 640, 480, 4)
		@clonePoint = 6
		@map = new Layer("screen", 640, 480, 10)
		@cloneMenu = new CloneMenu()
		@entities = new Array()
	
		@enemySpawner = new EnemySpawner()

		@output = new EntityList()
		
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
	addClonePoint:(number)=>
		@clonePoint = @clonePoint + number
	removeClonePoint:(number)=>
		@clonePoint = @clonePoint - number

	getClonePoints:->
		@clonePoint

	entitiesOnXCord:(x)->
		c = 0
		for entity in @entities
			if entity.x == x
				c++
		return c
	
	tick:=>
		for i in [0...@entities.length]
			now = @entities[i]
			
			if now.getHp() <= 0 
				now.delete()
				@entities.splice(i, 1)
				continue
			
			@entities[i].reset()			
			
			xpos = @entities[i].getX()+8
			
			for j in [0...@enemySpawner.getEntities().length]
				opposite = @enemySpawner.getEntities()[j]
				opposite_x = opposite.getX()-8				
				if opposite_x is xpos
					now.setStopped(true)
					opposite.setStopped(true)
					now.setHp(now.getHp()-opposite.getAp())
					opposite.setHp(opposite.getHp()-now.getAp())
				
				if opposite.getHp() is 0 then @enemySpawner.getEntities().splice(j, 1)
			
		this.addClonePoint(1)
		@enemySpawner.tick()
		for enemy in @enemySpawner.getEntities()
			if enemy.x == 0
				INPUT.freezeAll()
				alert("Du hast verloren!")
				return

			enemy.reset()
			enemy.tick()

		INFO.setText("no entity is selected")
	
	add:(element)=>
		if $(element).attr("entity") is "warrior" and @clonePoint > 0
			node = @output.addEntity("Warrior")
			@entities.push(new Warrior(node))
			this.removeClonePoint(1)
		if $(element).attr("entity") is "archer" and @clonePoint > 0
			node = @output.addEntity("Archer")
			@entities.push(new Archer(node))
			this.removeClonePoint(1)
				
	#render-method
	render:=>
		@ctx.clearRect(0, 0, WIDTH, HEIGHT)	
		@map.clear()
		@entitiesLayer.clear()
		
		for y in [0...6]
			for x in [0...8]
				index = x + y * 8
				if @data[index] is -1 then continue
				SPRITE.draw(@map.getContext(), x*8, y*8, @data[index])
		
		for i in [0...@entities.length]
			@entities[i].render(@entitiesLayer.getContext())
		
		for i in [0...@enemySpawner.getEntities().length]
			@enemySpawner.getEntities()[i].render(@entitiesLayer.getContext())
		
		@map.render()
		@cloneMenu.setTotal(@clonePoint)
		@entitiesLayer.render()

		@screen.render()
		
		window.requestAnimFrame(@render)

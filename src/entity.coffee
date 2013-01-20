class Entity
	constructor:->
		@x = 0
		@y = 0
	
	setX:(@x)->
	setY:(@y)->
	setPosition:(@x, @y)->
	tick:->
	render:(ctx)->

class Cloud extends Entity
	constructor:->
		super()
		#--++--
		#+++++-
		#--++++
		@structure = ["-","-","+","+","-","-","+","+","+","+","+","-","-","+","+","+","+","+"]
		@x = 30
		@y = 30
		@scale = 3
		
	render:(ctx, scale)->
		#ctx.beginPath()
		for h in [0...3]
			for w in [0...6]
				char = @structure[w+h*6]
				if char is "+"
					SPRITE.draw(ctx, (@x/@scale)+(8*w), (@y/@scale)+8*h, 4)
		ctx.fillStyle = 'white'
		ctx.fill()
		


class Warrior extends Entity
	constructor:(@node)->
		super()
		@y = (480/10)+(3*8)
		@move = 1
		@selected = false
		@hp = 10
		onclick = => 
			INFO.setText("Warrior:"+"movepoints"+@move+" HP:"+@hp)
			INPUT.setActual(@)
			
		
		$(@node).click(onclick)
	
	setSelected:(@selected)->
	
	update:=>
		INFO.setText("Warrior:"+"movepoints"+@move+" HP:"+@hp)
	
	doRight:->
		if @move > 0
			@x += 8 
			@move--
	
	doLeft:->
		if @move <  1
			@x -= 8 
			@move++
		
	reset:->
		@move = 1
		@selected = false
	
	tick:->
		#logic
	
	render:(ctx)->
		SPRITE.draw(ctx, @x, @y, 17)
		if @selected
			ctx.fillStyle = "red"
			ctx.fillRect(@x+3, @y-4, 2,2)


class Archer extends Entity
	constructor:(@node)->
		super()
		@y = (480/10)+(3*8)
		@move = 1
		@selected = false
		@hp = 10
		onclick = => 
			INFO.setText("Archer:"+"movepoints"+@move+" HP:"+@hp)
			INPUT.setActual(@)
		
		$(@node).click(onclick)
	
	setSelected:(@selected)->
	
	update:=>
		INFO.setText("Archer:"+"movepoints"+@move+" HP:"+@hp)
	
	doRight:->
		if @move > 0
			@x += 8 
			@move--
	
	doLeft:->
		if @move <  1
			@x -= 8 
			@move++
		
	reset:->
		@move = 1
		@selected = false
	
	tick:->
		#logic
	
	render:(ctx)->
		SPRITE.draw(ctx, @x, @y, 16)
		if @selected
			ctx.fillStyle = "red"
			ctx.fillRect(@x+3, @y-4, 2,2)


class BadArcher extends Entity
	constructor:->
		super()
		console.log("New bad archer")
		@x = (640/10)+(11*8)
		@y = (480/10)+(3*8)
		@move = 1
		@selected = false
		@hp = 10
	
	doRight:->
		if @move > 0
			@x -= 8 
			@move++
	
	doLeft:->
		if @move <  1
			@x += 8 
			@move--
		
	reset:->
		@move = 1
		@selected = false
	
	tick:->
		#logic
	
	render:(ctx)->
		SPRITE.draw(ctx, @x, @y, 18)
		if @selected
			ctx.fillStyle = "blue"
			ctx.fillRect(@x+3, @y-4, 2,2)

class BadWarrior extends Entity
	constructor:->
		super()
		@x = (640/10)+(11*8)
		@y = (480/10)+(3*8)
		@move = 1
		@selected = false
		@hp = 10
	
	doRight:->
		if @move > 0
			@x += 8 
			@move--
	
	doLeft:->
		if @move <  1
			@x -= 8 
			@move++
		
	reset:->
		@move = 1
		@selected = false
	
	tick:->
		#logic
	
	render:(ctx)->
		SPRITE.draw(ctx, @x, @y, 19)
		if @selected
			ctx.fillStyle = "red"
			ctx.fillRect(@x+3, @y-4, 2,2)


class EnemySpawner
	constructor:->
		@entities = new Array()

	getEntities:()->
		@entities

	spawn:->
		if Math.random() > 0.5
			@entities.push(new BadArcher())
		else
			@entities.push(new BadWarrior())

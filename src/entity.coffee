class Entity
	constructor:->
		@x = 0
		@y = 0
		@scale = 1
	
	setX:(@x)->
	setY:(@y)->
	setPosition:(@x, @y)->
	setScale:(@scale)->
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
		

class Soldier extends Entity
	constructor:(@node)->
		super()
		@y = (4*8*10)/2-8 #baseline	
		@move = 1
		@selected = false
	
	setSelected:(@selected)->
	
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

# Creates a new group
#   name = display name
#   initEntities = Array or List of entities 
#   (will be moved into a list anyway)
class Group
  constructor:(@name, initEntities)->
    @entities = new List()
    
    if initEntities instanceof Array
      @entities.add(entity) for entity in initEntities
    if initEntities instanceof List
      @entities = initEntities

  getEntities:->@entities
  addEntity:(entity)->@entities.add(entity)
  removeEntity:(entity)->@entities.del(entity)
		#ctx.fillStyle = 'white'
		#ctx.fill()

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
		@x = 30/3
		@y = 30/3
		
	render:(ctx)->
		#ctx.beginPath()
		for h in [0...3]
			for w in [0...6]
				char = @structure[w+h*6]
				if char is "+"
					SPRITE.draw(ctx, @x+(8*w), @y+8*h, 4)

		ctx.fillStyle = 'white'
		ctx.fill()
		

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

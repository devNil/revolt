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
		
	render:(ctx)->
		ctx.beginPath()
		for h in [0...3]
			for w in [0...6]
				char = @structure[w+h*6]
				if char is "+"
					ctx.rect(@x+16*w, @y+16*h, 16, 16)
				
		ctx.fillStyle = 'white'
		ctx.fill()
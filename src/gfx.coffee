class Layer
	constructor:(id, @width, @height, @scale)->
		@basectx = document.getElementById(id).getContext("2d")
		@basectx.webkitImageSmoothingEnabled = false
		@ctx = document.createElement("canvas").getContext("2d")
		@ctx.canvas.width = @width/@scale
		@ctx.canvas.height = @height/@scale

	render:->
		@basectx.drawImage(@ctx.canvas,0, 0, @width, @height)
	
	getContext:->@ctx
	
	getScale:->@scale
	
	clear:->
		@ctx.clearRect(0,0,@width,@height)
	
class Spritesheet
	constructor:(@img, @tilesize)-> 
	
	draw:(ctx, posx, posy, index)->
		for y in [0...8]
			for x in [0...8]
				if x+(y*@tilesize) is index
					ctx.drawImage(@img, x*@tilesize, y*@tilesize, @tilesize, @tilesize, posx, posy, @tilesize, @tilesize)
		
		
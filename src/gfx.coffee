class Layer
	constructor:(id, @width, @height, @scale)->
		@basectx = document.getElementById(id).getContext("2d")
		@ctx = document.createElement("canvas").getContext("2d")
		@ctx.canvas.width = @width/@scale
		@ctx.canvas.width = @height/@scale

	render:->
		@basectx.drawImage(@ctx.canvas,0, 0, @width, @height)
	
	getContext:->@ctx
		
		
		
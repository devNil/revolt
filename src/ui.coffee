class EntityList
	constructor:->
		@output = document.getElementById("output").getElementsByTagName("ul")[0]
	
	addEntity:(text)->
		li = document.createElement("li")
		a = document.createElement("a")
		a.href = "#"
		a.innerText = text
		li.appendChild(a)
		@output.appendChild(li)
		li

class InputHandler
	constructor:->
		@actual = null
		
		action = (element)=>
			if $(element).attr("action") is "forward"
				@actual.doRight()
			
			if $(element).attr("action") is "backward"
				@actual.doLeft()
			@actual.update()
		
		buttons = document.getElementById("controls").getElementsByTagName("button")
		for i in [0...buttons.length]
			$(buttons[i]).click(->action(this))
	
	setActual:(actual)->
		@actual.setSelected(false) if @actual?
		@actual = actual
		@actual.setSelected(true)
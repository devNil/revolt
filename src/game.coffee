#main-method
$ =>
	prelude = new Prelude()
	SPRITE = prelude.addImage("img/sprites.png")
	GAME = new Game()

#Game Class
class Game
	
	WIDTH = 640
	HEIGHT = 480
	SCALE = 4
	
	constructor:->
	
		
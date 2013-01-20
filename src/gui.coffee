class CloneEntry
  constructor:(@id,@name,@startPoints)->
    @points = @startPoints
    @div = document.getElementById(@name)
  getPoints:->
    @points
  addPoint:->
    @points = @points + 1
  removePoint:->
    @points = @points - 1
  tick:->
    @div = @points

class CloneMenu
  constructor:->
    @base = document.getElementById("cloneMenu")
    @total = document.getElementById("total")
  
  setTotal:(points)->
    @total.innerText = points

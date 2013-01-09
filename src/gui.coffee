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
    
# ==> Work in progress here
class GroupEntry
  constructor:(@parentDiv, @group)->
    @updateView()
  
  getAssignedGroup:-> @group
   
  updateView: ->
    @warrCount = 0
    @archCount = 0

    for entity in @group.getEntities()
      @warrCount++ if entity instanceof Warrior
      @archCount++ if entity instanceof Archer

    @parentDiv.innerHTML += "<div id=\"groupEntry\"><a href=\"#\">#{@group.name}</a>
     Warriors: #{@warrCount}<br/>Archers: #{@archCount}
     <input type=\"button\" id=\"attackBtn\"/></input>
     <input type=\"button\" id=\"retreatBtn\"></input>
     </div>"


class GroupMenu
  # groups = array of groups object
  constructor:(@groups)->
    # Parent Div
    @groupDiv = document.getElementById("groupContainer")
    # List of groups
    @groupList = new List()
    
    for i in [0...@groups.length]    
      @groupList.add(new GroupEntry(@groupDiv , @groups[i]))
      
  refreshGroupView:->
   
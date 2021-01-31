import * as UIController from "./UIController.coffee"
import * as Core from "./Core.coffee"

selector = UIController.getSelector();

loadEventListeners = ->    
    UIController.getElement(selector.add_btn).addEventListener('click', Core.addTodo) 

loadChart = ->
    UIController.drawChart selector.todo_chart

export default init = ->
    console.log "app init..."
    loadEventListeners()
    #loadChart()

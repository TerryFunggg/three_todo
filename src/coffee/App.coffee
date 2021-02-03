import UIController from "./UIController.coffee"
import Core from "./Core.coffee"
import Storage from "./Storage.coffee"

export default class App
    constructor: ->
        # init controllers
        @ui = new UIController()
        @selector = @ui.getSelector()
        @core = new Core(@ui)

        @loadEvents()
        window.deleteTodo = @core.deleteTodo

        return @core.loadTodo() if @core.isToday()
        @cleanUp()


    loadEvents: ->
        applyListeners = (type,domEl,listener) => @ui.getElement(domEl).addEventListener type, listener
        applyListeners ...el for el in @listenerConfig()

    ###
        [type, dom element id/class , listener ]
    ###
    listenerConfig: ->
        [
            ['click', @selector.add_btn, @core.addTodo],
        ]

    cleanUp: -> Storage.todos().clean()

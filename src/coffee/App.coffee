import UIController from "./UIController.coffee"
import Core from "./Core.coffee"

export default class App
    constructor: ->
        # init controllers
        @ui = new UIController()
        @selector = @ui.getSelector()
        @core = new Core(@ui)

        console.log "app init..."
        @loadEvents()


    loadEvents: ->
        applyListener = (arr) => @ui.getElement(arr[1]).addEventListener(arr[0],arr[2])
        applyListener el for el in @listenerConfig()

    ###
        [type, dom element id/class , listener ]
    ###
    listenerConfig: ->
        [
            ['click',@selector.add_btn,@core.addTodo]
        ]

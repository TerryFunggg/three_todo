export default class UIController

    constructor: ->
        @selector =
            todo_container:'.todo-container',
            add_btn:'#add-todo-btn',
            todo_chart: 'todo-chart'


    getSelector: -> @selector

    getElement : (el) -> document.querySelector(el)

    addTodo : (item) ->
        @getElement(@selector.todo_container).appendChild item

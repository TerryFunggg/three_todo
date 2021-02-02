export default class UIController

    constructor: ->
        @selector =
            todo_container:'.todo-container',
            add_btn:'#add-todo-btn',
            todo_delete: '.todo-delete'

    getSelector: -> @selector

    getElement : (el) -> document.querySelector(el)

    addTodo : (item) ->
        @getElement(@selector.todo_container).innerHTML += item

    deleteTodo: (item) ->
        item.parentElement.remove();

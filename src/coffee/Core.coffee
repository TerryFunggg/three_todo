import Storage from "./Storage.coffee"

class Core
    constructor: (@ui) ->
        @num_of_todo = 0


    createTodoItem: (todo) ->
        " <div class='item'>
            <i class='fas fa-times todo-delete' onclick='deleteTodo(this)'></i>
            <span>#{todo}</span>
            </div>"

    # This function called by EventListener, so it need to be use fat arrows
    addTodo: =>
        text = prompt("Todo items?") unless @num_of_todo >= 3
        return if !text

        @add text
        @num_of_todo++
        Storage.todos().addTodo(text)

    add:(item) ->
        todo = @createTodoItem item
        @ui.addTodo todo


    deleteTodo: (el) =>
        todo = el.parentElement.innerText
        @num_of_todo-- if @num_of_todo >=0
        @ui.deleteTodo el

        Storage.todos().deleteTodo(todo)


    loadTodo: ->
        todos = Storage.todos().getLists()
        addToUI = (todo) => @ui.addTodo @createTodoItem todo
        addToUI todo for todo in todos


    isToday: () ->
        date = Storage.todos().getExp()
        return false unless date?

        date = new Date(date);
        today = new Date();

        year = (d1,d2) => d1.getYear() is d2.getYear()
        month = (d1,d2) => d1.getMonth() is d2.getMonth()
        day = (d1,d2) => d1.getDay() is d2.getDay()

        checkList = [year,month,day];
        isPass = (check) => check(date,today)

        checkList.every(isPass)


export default Core

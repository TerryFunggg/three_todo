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
        #todo = @createHTMLBlock([["div","item"],["span","",text],["i","fas fa-times todo-delete"]])
        todo = @createTodoItem text
        @ui.addTodo todo
        @num_of_todo++

    deleteTodo: (el) =>
        @num_of_todo-- if @num_of_todo >=0
        @ui.deleteTodo el

export default Core

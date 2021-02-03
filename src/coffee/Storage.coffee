export default class Storage
    constructor: ->
        @storage = null
        @todoList = localStorage


    @todos: ->
        return @storage if @storage?
        @storage = new Storage()


    getLists: ->
        JSON.parse(@todoList.getItem('todos')) || []


    getLength: ->
        JSON.parse(@todoList.getItem('todos')).lenght || 0


    addTodo:(item)->
        @addExp() unless @getExp()?

        todos =  @getLists()
        todos.push item
        @saveTodos todos


    deleteTodo: (todo) ->
        todos = @getLists()
        todos.splice(todos.indexOf(todo) ,1)
        @saveTodos todos


    saveTodos: (todos) ->
         @todoList.setItem('todos', JSON.stringify(todos))


    removeTodos: -> @todoList.removeItem('todos')

    removeExp: -> @todoList.removeItem('date')


    addExp: ->
        @todoList.setItem('date', new Date())


    getExp: =>
        @todoList.getItem('date') || null

    clean: ->
        @removeTodos()
        @removeExp()

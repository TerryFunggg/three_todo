class Core
    constructor: (@ui) ->
        @num_of_todo = 0


    createElement: (arr) ->
        node = document.createElement arr[0]
        node.className = arr[1] || ''
        node.innerHTML = arr[2] if arr[2]?
        node

    createHTMLBlock: (elements) ->
         # create the root node first
         nodes = @createElement elements.shift()
         # then for add each sub-node from array
         elements.map((arr) =>
             node = @createElement arr
             nodes.appendChild node
         );
         nodes


    # This function called by EventListener, so it need to be use fat arrows
    addTodo: =>
        text = prompt("Todo items?") unless @num_of_todo >= 3
        return if !text
        todo = @createHTMLBlock([["div","item"],["span","",text],["i","fas fa-times"]])
        @ui.addTodo todo
        @num_of_todo++

export default Core

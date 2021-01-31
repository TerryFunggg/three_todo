import * as Chart from "./Chart.coffee"

selector =
    todo_container:'.todo-container',
    add_btn:'#add-todo-btn',
    todo_chart: 'todo-chart'

export getSelector = -> selector
export getElement = (el) -> document.querySelector(el)
export addTodo = (item) ->
    getElement(selector.todo_container).appendChild item

export drawChart = (ctx) -> Chart.getChart ctx
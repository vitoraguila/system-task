$(document).on 'turbolinks:load', ->
  
  $('body').on 'click', 'a.remove_task', (e) ->
    $.ajax '/subtasks/'+ e.currentTarget.id,
        type: 'DELETE'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          Materialize.toast('Subtask removed', 4000, 'green')
          $('#task_' + e.currentTarget.id).remove() 
          location.reload()
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problem with remotion of subtask', 4000, 'red')
    return false

  $('.new_subtask').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'POST'
        dataType: 'json',
        data: $(".new_subtask").serialize()
        success: (data, text, jqXHR) ->
          insert_task(data['id'], data['description'],  data['subtask_date'], data['subtask_hour'])
          $('#subtask_description, #subtask_date, #subtask_hour').val("")
          Materialize.toast('Task added', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problem in include subtask', 4000, 'red')
    return false


insert_task = (id, description, date, hour) ->
  $('.task_list').append(
    '<tr class="subtask" id="subtask_' + id + '">' +
      '<td>' + description + '</td>' +
      '<td>' + date + '-' + hour + '</td>' +
      '<td>' + status + '</td>' +
      '<td></td>' +
    '</tr>')
              


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@sort_base_url = ->
  method = if $('#cur_method').val() == 'edit_multiple' then '/edit_multiple' else ''
  controller =  $('#search').attr('cname')
  controller = controller + "/" + $('#search').attr('mname') if controller == 'options'
  if controller == undefined
    href = window.location.toString().split("/")[3]
    controller = href
  return controller+method

@sortable_prepare = (params, getFromUrl = false) ->
  actual = if $('.switcher_a .link_a').length == 0 then null else $('.switcher_a .link_a').hasClass('on')
  search = $('#search').val()

  $('.search_save a').each (i) ->
    href = new URL(this.href)
    if search == '' 
      href.searchParams.delete('search')
    else 
      href.searchParams.set('search', search)
    this.href = href

  url = {    
    only_actual: actual
    sort: $('span.active').attr('sort')
    direction: $('span.active').attr('direction')
    search: search
  }
  
  l = window.location.toString().split('?')
  p = q2ajx(l[1])
  ser = $('.index_filter').serialize()
  if ser == ""
    ser = $('.index_filter select').serialize()
  if_params = q2ajx(ser)
  
  each p, (i, a) -> # restore params from url
    if url[i] == undefined || ['search','page','_'].include? i 
      url[i] = a
    return

  each if_params, (i, a) -> # add params from .index_filter
    url[i] = a
    return

  each params, (i, a) -> # add params from args hash
    url[i] = a
    return 
 
  each url, (i, a) ->
    if (a == 0 || a == '0' || a == undefined)
      delete url[i]  
    return 
  return url

@sortable_query = (params)->
  url = sortable_prepare(params)
  base_url = sort_base_url()

  $.get '/'+base_url, url, null, 'script'
  setLoc(""+base_url+"?"+ajx2q(url));
  return

@modal_apply = (th, newItem=false)->
  prm = th.attr('prm')
  action = th.attr('action')
  item_id = th.attr('item_id')
  model = th.attr('model')
  params = $('[name^='+prm+']').serialize()    
  # console.log()
  if th.hasClass('new') || newItem 
    type = 'POST' 
    url  = action
  else 
    type = 'PATCH'
    url  = action+item_id

  # upd_param(params+'&model='+model+'&id='+item_id,true,true)
  $.ajax
    url: url
    data: params
    dataType: 'script'
    type: type
    success: (event, xhr, settings) ->
      if event.includes('.js-notes')
        eval(event)
      else
        show_ajax_message('Успешно обновлено','success')
    error: (evt, xhr, status, error) ->  
      show_ajax_message("Ошибка обновления: " + status.message,'error')        

$(document).ready ->
  $(document).off('click', 'span.modal_apply').on 'click', 'span.modal_apply', ->
    modal_apply($(this))

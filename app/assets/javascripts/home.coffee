# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('body').on 'click', '.content-tree li.folder > a', (ev)->
    $(ev.target).parents('.node').first().toggleClass('node-folder-closed').toggleClass('node-folder-open')

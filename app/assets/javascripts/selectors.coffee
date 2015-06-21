$ ->
  $.fn.selectorHost = ->
    @each ->
      console.log $('.item-placeholder', @)
      $('.item-placeholder', @).droppable
        accept: '.item'
        activeClass: 'is-acvive'

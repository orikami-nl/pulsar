$.curCSS = $.css # jquery - jquery.ui bugfix


Dominoes = new Meteor.Collection("dominoes")

Meteor.autorun ->
  Meteor.subscribe "dominoes"

Template.board.dominoes = ->
  console.log 'dominoes context'
  Dominoes.find()

Template.board.rendered = ->
  console.log 'board rendered'
  $('.domino').draggable()

Template.board.events(
  'click .add-domino': (e) ->
    type = Random.choice("abcdefghijklmnopqrstuvwxyzABCDEFGHIJK")
    orientation = Random.choice("nswe")
    pos_x = Math.round(Random.fraction()*22*10*4)
    pos_y = Math.round(Random.fraction()*22*5*4)
    Dominoes.insert({type: type, orientation: orientation, pos_x: pos_x, pos_y: pos_y})

  'click .clear-dominoes': (e) ->
    Dominoes.remove({})
    
  'contextmenu .domino': (e) ->
    ori = "nesw".indexOf(@orientation)
    @orientation = "neswn"[ori+1]

    pos = $(e.currentTarget).position()
    Dominoes.update({_id:@_id},{$set: {orientation: @orientation,pos_x: pos.left, pos_y: pos.top}})
    e.preventDefault()

  'mouseup .domino':(e) ->
    pos = $(e.target).position()
    Dominoes.update({_id: @_id},{$set: {pos_x: pos.left, pos_y: pos.top}})
    #console.log 'stop',e,$(e.target),pos
)


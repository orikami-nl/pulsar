$.curCSS = $.css # jquery - jquery.ui bugfix


Dominoes = new Meteor.Collection("dominoes")

Meteor.autorun ->
  Meteor.subscribe "dominoes"

Template.board.dominoes = ->
  console.log 'dominoes context'
  Dominoes.find()

Template.domino.rendered = ->
  console.log $(@firstNode)
  $(@firstNode).draggable(
    start: (e) =>
      console.log e
      Session.set('dragging', true)
    stop: (e) =>
      console.log @data._id
      pos = $(@firstNode).position()
      Dominoes.update({_id: @data._id},{$set: {pos_x: pos.left, pos_y: pos.top}})
      console.log 'stop'
  )

Template.domino.preserve(['.domino']) 

Template.board.events(
  'click .add-domino': (e) ->
    type = Random.choice("abcdefghijklmnopqrstuvwxyzABCDEFGHIJK")
    orientation = Random.choice("n")
    pos_x = Math.round(Random.fraction()*22*10*4)
    pos_y = Math.round(Random.fraction()*22*5*4)
    Dominoes.insert({type: type, orientation: orientation, pos_x: pos_x, pos_y: pos_y})

  'click .clear-dominoes': (e) ->
    Dominoes.remove({})
    
  'click .domino': (e) ->
    if Session.get('dragging')
      Session.set('dragging', false)
    else
      console.log e
      ori = "nesw".indexOf(@orientation)
      @orientation = "neswn"[ori+1]

      pos = $(e.currentTarget).position()
      Dominoes.update({_id:@_id},{$set: {orientation: @orientation}})
)


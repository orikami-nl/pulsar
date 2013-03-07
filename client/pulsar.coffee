$.curCSS = $.css # jquery - jquery.ui bugfix


Dominoes = new Meteor.Collection("dominoes")

Meteor.autorun ->
  Meteor.subscribe "dominoes"

Template.board.dominoes = ->
  Dominoes.find({}).fetch()

Template.board.events(
  'click .add-domino': (e) ->
    type = Random.choice("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    orientation = "orientation-" + Random.choice("nswe")
    Dominoes.insert({type: type, orientation: orientation})
  'click .domino': (e) ->
    pos = "nesw".find(@orientation)
    @orientation = "nesw"[pos+1]
)

Template.board.rendered = ->
  $('.domino').draggable({grid: [22,22]})


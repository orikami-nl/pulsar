$.curCSS = $.css # jquery - jquery.ui bugfix


Dominoes = new Meteor.Collection("dominoes")

Meteor.autorun ->
  Meteor.subscribe "dominoes"

Template.board.dominoes = ->
  Dominoes.find({}).fetch()

Template.board.events(
  'click .add-domino': (e) ->
    type = Random.choice("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    orientation = Random.choice("nswe")
    Dominoes.insert({type: type, orientation: orientation})

  'click .domino': (e) ->
    pos = "nesw".indexOf(@orientation)
    @orientation = "neswn"[pos+1]

    console.log(pos,@orientation)
    Dominoes.update({_id:@_id},{$set: {orientation: @orientation}})
)

Template.board.rendered = ->
  $('.domino').draggable({grid: [22,22]})


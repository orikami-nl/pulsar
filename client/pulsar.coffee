Dominoes = new Meteor.Collection("dominoes")

Meteor.autorun ->
  Meteor.subscribe "dominoes"

Template.board.dominoes = ->
  Dominoes.find({}).fetch()

Template.board.events(
  'click .add-domino': (e) ->
    console.log e
    type = Random.choice("qwertyuiopasdfghjklkzxcvbnm")
    orientation = Random.choice("nswe")
    Dominoes.insert({type: type, orientation: orientation})
 )

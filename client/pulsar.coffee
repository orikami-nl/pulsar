Dominoes = new Meteor.Collection("dominoes")

Meteor.autorun ->
  Meteor.subscribe "dominoes"

Template.board.dominoes = ->
  Dominoes.find({}).fetch()

Template.board.events(
  'click .add-domino': (e)->
    type = Random.choice("qwertyuiopasdfghjklkzxcvbnm")
    Dominoes.insert({type: type})
)
Dominoes = new Meteor.Collection("dominoes")

Meteor.autorun ->
  Meteor.subscribe "dominoes"

Template.board.dominoes = ->
  Dominoes.find({}).fetch()
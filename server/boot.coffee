Dominoes = new Meteor.Collection("dominoes")

Meteor.publish "dominoes", ->
  Dominoes.find({})
  
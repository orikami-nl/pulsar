Dominoes = new Meteor.Collection("dominoes")

Meteor.publish "dominoes", ->
  Dominoes.find({})
  
Meteor.startup ->
  Dominoes.remove({})
  for a in "qwertyuiopasdfghjklkzxcvbnm"
    Dominoes.insert({type: a})
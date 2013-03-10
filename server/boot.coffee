Dominoes = new Meteor.Collection("dominoes")

Meteor.publish "dominoes", ->
  Dominoes.find({})
  
Meteor.startup ->
  Dominoes.remove({})
  for a in "abcdef"
    orientation = Random.choice("n")
    pos_x = Math.round(Random.fraction()*22*10*4)
    pos_y = Math.round(Random.fraction()*22*5*4)
    Dominoes.insert({type: a, orientation: orientation, pos_x: pos_x, pos_y: pos_y})
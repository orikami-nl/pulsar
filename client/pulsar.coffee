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
    pos_x = Math.round(Random.fraction()*22*10)
    pos_y = Math.round(Random.fraction()*22*5)
    Dominoes.insert({type: type, orientation: orientation, pos_x: pos_x, pos_y: pos_y})
 )

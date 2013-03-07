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
    pos_x = Math.round(Random.fraction()*22*10)
    pos_y = Math.round(Random.fraction()*22*5)
    Dominoes.insert({type: type, orientation: orientation, pos_x: pos_x, pos_y: pos_y})

  'click .domino': (e) ->
    pos = "nesw".indexOf(@orientation)
    @orientation = "neswn"[pos+1]

    console.log(pos,@orientation)
    Dominoes.update({_id:@_id},{$set: {orientation: @orientation}})

  'dragstop .domino': (e) ->
    pos = event.currentTarget.position()
    Dominoes.update({_id: @id},{$set: {pos_x: pos.left, pos_y: pos.top}})
)

Template.board.rendered = ->
  $('.domino').draggable({grid: [22,22]})


# Description
#   Play "Who's That Pokemon?" with Hubot using the Gen I lineup. This is an easy version
#   of the original, since it uses the real images instead of silhouettes.
#
# Dependencies:
#   hubot-redis-brain
#
# Configuration:
#   None
#
# Commands:
#   hubot poke play        - start the game by displaying a poke image
#   hubot poke it's <name> - guess the poke
#   hubot poke give up     - give up and find out which poke it was
#
# Author:
#   github.com/mattantonelli

# Pokemon Gen I JSON via Pokodox
URL = 'https://pokodox.herokuapp.com/pokez'

module.exports = (robot) ->

  robot.respond /poke play/i, (msg) ->
    startGame(msg)

  robot.respond /poke it's (\w+)/i, (msg) ->
    guessPoke(msg, msg.match[1])

  robot.respond /poke give up/i, (msg) ->
    giveUp(msg)

  startGame = (msg) ->
    num = randomInt(1, 151)
    robot.http("#{URL}/#{num}")
      .get() (err, res, body) ->
        name = JSON.parse(body).name
        img  = JSON.parse(body).url
        robot.brain.set('pokemon', name)
        msg.send "Who's That Pokemon? #{img}"

  guessPoke = (msg, guess) ->
    name = robot.brain.get('pokemon')
    if name != null
      if guess.toLowerCase() == name.toLowerCase()
        msg.send "You got it! It's #{name}!"
        robot.brain.set('pokemon', null)
      else
        msg.send 'Nope. Try again!'

  giveUp = (msg) ->
    name = robot.brain.get('pokemon')
    if name != null
      msg.send("It was #{name}!")
      robot.brain.set('pokemon', null)

  randomInt = (min, max) ->
    return Math.floor(Math.random() * (max + 1 - min) + min)


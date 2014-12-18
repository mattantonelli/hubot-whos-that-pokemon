# Pokémon Gen I JSON via Pokodox
URL = "https://pokodox.herokuapp.com/pokez"

module.exports = (robot) ->

  # Start the game
  robot.respond /play.*pokemon/i, (msg) ->
    startGame(msg)

  # Guess the poke
  robot.respond /it's (.*)/i, (msg) ->
    guessPoke(msg, msg.match[1])

  # Give up
  robot.respond /give up/i, (msg) ->
    giveUp(msg)

  # Start the game by grabbing a random Pokémon and displaying its picture
  startGame = (msg) ->
    num = randomInt(1, 151)
    robot.http("#{URL}/#{num}")
      .get() (err, res, body) ->
        name = JSON.parse(body).name
        img  = JSON.parse(body).url
        robot.brain.set('pokemon', name)
        msg.send "Who's That Pokemon? #{img}"

  # Determines if the player's guess is correct
  guessPoke = (msg, guess) ->
    name = robot.brain.get('pokemon')
    if name != null
      if guess.toLowerCase() == name.toLowerCase()
        msg.send "You got it! It's #{name}!"
        robot.brain.set('pokemon', null)
      else
        msg.send "Nope. Try again!"

  # Give up and show the correct answer
  giveUp = (msg) ->
    name = robot.brain.get('pokemon')
    if name != null
      msg.send("It was #{name}!")
      robot.brain.set('pokemon', null)

  # Returns a random number between [min, max]
  randomInt = (min, max) ->
    return Math.floor(Math.random() * (max + 1 - min) + min)

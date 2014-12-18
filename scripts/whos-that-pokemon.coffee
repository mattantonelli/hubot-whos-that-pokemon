# Pokémon Gen I JSON via Pokodox
URL = "https://pokodox.herokuapp.com/pokez"

module.exports = (robot) ->

  # Start playing the game
  robot.respond /play/i, (msg) ->
    startGame(msg)

  # Start the game by grabbing a random Pokémon and displaying its picture
  startGame = (msg) ->
    num = randomInt(1, 151)
    robot.http("#{URL}/#{num}")
      .get() (err, res, body) ->
        name = JSON.parse(body).name
        img  = JSON.parse(body).url
        msg.send "Who's That Pokemon? #{img}"

  # Returns a random number between [min, max]
  randomInt = (min, max) ->
    return Math.floor(Math.random() * (max + 1 - min) + min)

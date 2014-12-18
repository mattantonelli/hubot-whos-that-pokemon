chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
expect = chai.expect

describe 'whos-that-pokemon', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
    require('../src/whos-that-pokemon')(@robot)

  it 'registers a respond listener for the start command', ->
    expect(@robot.respond).to.have.been.calledWith(/poke play/i)

  it 'registers a respond listener for the guess command', ->
    expect(@robot.respond).to.have.been.calledWith(/poke it's (\w+)/i)

  it 'registers a respond listener for the forfeit command', ->
    expect(@robot.respond).to.have.been.calledWith(/poke give up/i)


{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'shiranakatta', ->
  beforeEach (done) ->
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', -> null
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      done()
    @robot.run()

  afterEach (done) ->
    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    beforeEach ->
      @sender = new User 'bouzuya', room: 'hitoridokusho'
      @callback = @sinon.spy()
      @robot.listeners[0].callback = @callback

    describe 'receive "知らなかった　そんなの……"', ->
      beforeEach ->
        message = '知らなかった　そんなの……'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'matches', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 1
        assert match[0] is '知らなかった　そんなの'

    describe 'receive "知らなかった　そんなの"', ->
      beforeEach ->
        message = '知らなかった　そんなの'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'matches', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 1
        assert match[0] is '知らなかった　そんなの'

    describe 'receive "知らなかったそんなの"', ->
      beforeEach ->
        message = '知らなかったそんなの'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'matches', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 1
        assert match[0] is '知らなかったそんなの'

    describe 'receive "しらなかったそんなの"', ->
      beforeEach ->
        message = 'しらなかったそんなの'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'matches', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 1
        assert match[0] is 'しらなかったそんなの'

  describe 'listeners[0].callback', ->
    beforeEach ->
      @shiranakatta = @robot.listeners[0].callback
      @url = 'http://s3-ap-northeast-1.amazonaws.com/shiranakatta/sonnano.jpg'

    describe 'receive "しらなかったそんなの"', ->
      beforeEach ->
        @send = @sinon.spy()
        @shiranakatta
          match: ['しらなかったそんなの']
          send: @send

      it 'send "http://.../shiranakatta/sonnano.jpg"', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is @url

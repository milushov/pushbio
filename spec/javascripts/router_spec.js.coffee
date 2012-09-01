#= require spec_helper

describe 'Router', ->

  router = null
  beforeEach -> router = new Router()

  describe 'view routes', ->

    it 'should be defined', ->
      # TODO: Refactor constant usage
      'home form new history faq error'.split(/\s/).each (view) ->
        router[view].should.be.exists
        router[view].should.be.a 'function'

  describe 'route', ->

  describe 'checkAccess', ->

    beforeEach -> sinon.stub(router, 'userLoggedIn')

    describe 'user is logged in', ->
      beforeEach -> router.userLoggedIn.returns(true)

      it 'should allow access to every page', ->
        'home form new history faq error'.split(/\s/).each (page) ->
          router.checkAccess(page).should.be.ok

    describe 'user is not logged in', ->
      beforeEach -> router.userLoggedIn.returns(false)

      it 'should allow access to home, history, faq and error', ->
        'home history faq error'.split(/\s/).each (page) ->
          router.checkAccess(page).should.be.ok

      it 'should not allow access to form and new', ->
        'form new'.split(/\s/).each (page) ->
          router.checkAccess(page).should.be.not.ok

  describe 'userLoggedIn', ->

    it 'should return currentUser status', ->
      window.currentUser = {}

      stub = window.currentUser.loggedIn = sinon.stub().returns(42)
      router.userLoggedIn()
      stub.should.have.been.calledWith()

      stub.reset()
      router.userLoggedIn().should.eq 42

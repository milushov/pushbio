#= require spec_helper

describe 'Router', ->

  loginUser = ->
    sinon.stub(currentUser, 'loggedIn').returns(true)

  router = null

  beforeEach ->
    router = new Router()
    window.currentUser = loggedIn: -> false

  describe 'view routes', ->

    it 'should be defined', ->
      # TODO: Refactor constant usage
      'home form new history faq error'.split(/\s/).each (view) ->
        router[view].should.be.exists
        router[view].should.be.a 'function'

  describe 'root', ->

    navigate = null

    beforeEach ->
      navigate = sinon.stub(router, 'navigate')

    describe 'lastPage is stored in settings', ->

      beforeEach ->
        window.settings = get: -> 'new'

      it 'should redirect to last opened page', ->
        loginUser()
        router.root()
        navigate.should.have.been.calledWith('new')

      it 'should redirect to home if user in not logged in', ->
        router.root()
        navigate.should.have.been.calledWith('home')

    describe 'user logged in', ->
      beforeEach loginUser

      it 'should redirect to edit profile form', ->
        router.root()
        navigate.should.have.been.calledWith('form')

    describe 'user is not logged in', ->

      it 'should redirect to home page', ->
        router.root()
        navigate.should.have.been.calledWith('home')

  describe 'checkAccess', ->

    describe 'user is logged in', ->
      beforeEach loginUser

      it 'should allow access to every page', ->
        'home form new history faq error'.split(/\s/).each (page) ->
          router.checkAccess(page).should.be.ok

    describe 'user is not logged in', ->

      it 'should allow access to home, history, faq and error', ->
        'home history faq error'.split(/\s/).each (page) ->
          router.checkAccess(page).should.be.ok

      it 'should not allow access to form and new', ->
        'form new'.split(/\s/).each (page) ->
          router.checkAccess(page).should.be.not.ok

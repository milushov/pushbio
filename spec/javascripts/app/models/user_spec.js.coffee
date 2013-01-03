#= require spec_helper

describe 'App.User', ->

  describe '.loggedIn()', ->

    it 'should return false if id in not number', ->
      new App.User().loggedIn().should.be.false
      new App.User(id: 'current').loggedIn().should.be.false

    it 'should return true if id is ok', ->
      new App.User(id: 123).loggedIn().should.be.true


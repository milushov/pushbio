#= require spec_helper

describe 'User', ->

  describe '.loggedIn()', ->

    it 'should return false if id in not number', ->
      new User().loggedIn().should.be.false
      new User(id: 'current').loggedIn().should.be.false

    it 'should return true if id is ok', ->
      new User(id: 123).loggedIn().should.be.true


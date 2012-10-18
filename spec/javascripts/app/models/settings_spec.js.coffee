#= require spec_helper

describe 'Settings', ->

  beforeEach ->
    Modernizr.localstorage = true

  it 'should not fail if local storage is not supports by browser', ->
    Modernizr.localstorage = false

    settings = null
    expect(-> new Settings()).to.not.throw
    settings.get('lastPage').should.be.undefined

  it 'should read settings from localStorage', ->
    getItem = stub(localStorage, 'getItem')
    settings = new Settings()
    getItem.should.have.been.calledWith('settings')

  it 'should immediately write settings to localStorage', ->
    setItem = stub(localStorage, 'getItem')
    settings = new Settings()
    setItem.should.have.been.calledWith \
      'settings', lastPage: 'new', test: 'test'

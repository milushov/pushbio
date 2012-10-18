#= require spec_helper

describe 'Settings', ->

  beforeEach ->
    Modernizr.localstorage = true

  it 'should not fail if local storage is not supports by browser', ->
    Modernizr.localstorage = false

    settings = null
    expect(-> settings = new Settings()).to.not.throw()
    expect(settings.get('lastPage')).to.be.undefined

  it 'should read settings from localStorage', ->
    getItem = sinon.stub(localStorage, 'getItem')
    settings = new Settings()
    getItem.should.have.been.calledWith('settings')

  it 'should immediately write settings to localStorage', ->
    setItem = sinon.stub(localStorage, 'setItem')
    settings = new Settings()
    setItem.should.have.been.calledWith \
      'settings', lastPage: 'new', test: 'test'

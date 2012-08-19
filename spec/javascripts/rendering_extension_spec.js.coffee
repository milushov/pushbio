#= require spec_helper

describe 'RenderingExtension', ->

  describe '.renderHTML()', ->

    it 'should return HTML code of specified template', ->
      html = RenderingExtension.renderHTML('dummy')
      html.should.be.a 'string'
      html.should.be.eql '<h1>Just do it!</h1>'

    it 'should return HTML object with iterpolated values', ->
      RenderingExtension.renderHTML('user', name: 'Sasha Koss', bio: 'Vegitable.').should.eql \
        '<h1>Sasha Koss</h1><h2>Vegitable.</h2>'

  describe '.render()', ->

    it 'should return jQuery object', ->
      el = RenderingExtension.render('fixtures/templates/dummy')
      el.should.contain('Just do it!')
      el.html().should.be.eql '<h1>Just do it!</h1>'

    it 'should return jQuery object with iterpolated values', ->
      el = RenderingExtension.render('user', name: 'Sasha Koss', bio: 'Vegitable.')
      el.should.contain('Sasha Koss')
      el.should.contain('Vegitable.')

  describe 'integration with Backbone.View', ->

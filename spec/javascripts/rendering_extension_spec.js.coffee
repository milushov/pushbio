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
      el = RenderingExtension.render('dummy')
      el.should.contain('Just do it!')
      el[0].outerHTML.should.be.eql '<h1>Just do it!</h1>'

    it 'should return jQuery object with iterpolated values', ->
      el = RenderingExtension.render('user', name: 'Sasha Koss', bio: 'Vegitable.')
      el.should.contain('Sasha Koss')
      el.should.contain('Vegitable.')

  describe 'integration with Backbone.View', ->

    class ExtendedView extends Backbone.View
    Object.merge(ExtendedView::, RenderingExtension)

    it 'should have render and renderHTML functions', ->
      view = new ExtendedView()
      view.render.should.exists
      view.render.should.be.a 'function'
      view.renderHTML.should.exists
      view.renderHTML.should.be.a 'function'

    it 'should extend properly', ->
      view = new ExtendedView()
      view.renderHTML('dummy').should.be.eql '<h1>Just do it!</h1>'
      view.render('dummy')[0].outerHTML.should.be.eq '<h1>Just do it!</h1>'



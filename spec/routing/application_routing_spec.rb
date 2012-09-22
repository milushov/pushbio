require 'spec_helper'

describe HomeController do
  describe 'routing' do
    it 'routes to #index' do
      get(root_path).should route_to('home#index')
      I18n.locale.should == :ru
    end

    it 'routes to #index with en locale' do
      get('/en').should route_to('home#index', locale: 'en')
    end

    it 'routes to #index with ru locale' do
      get('/ru').should route_to('home#index', locale: 'ru')
    end
  end
end

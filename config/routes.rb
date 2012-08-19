Pushbio::Application.routes.draw do
  match '/:locale', to: 'home#index', locale: /ru|en/

  scope "(:locale)", locale: /ru|en/ do
    root to: 'home#index'
  end
end

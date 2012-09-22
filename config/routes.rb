Pushbio::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  match '/:locale', to: 'home#index', locale: /ru|en/

  scope "(:locale)", locale: /ru|en/ do
    root to: 'home#index'
  end
end

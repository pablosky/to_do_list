Rails.application.routes.draw do
  root to: 'home#index'

  scope '/api' do
    post '/register_user' => 'api#register_user'
  end
end

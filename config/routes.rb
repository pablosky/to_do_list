Rails.application.routes.draw do
  root to: 'home#index'

  scope '/api' do
    post '/register_user' => 'api#register_user'
    post '/create_to_do_list' => 'api#create_to_do_list'
    post '/add_task' => 'api#add_task'
    post '/mark_task' => 'api#mark_task'
    get '/user_tasks' => 'api#user_tasks'
  end
end

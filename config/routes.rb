Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post '/posts/create' => 'posts#create'
  get '/posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'
  post '/posts/:id/destroy' => 'posts#destroy'
end

Iwitness::Application.routes.draw do
  #home
  root :to => 'pages#index'
  # post 'index' => 'pages#index'
  # replaces the above to try deal with session search better
  post 'index' => 'session#index'
  #sessions
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  # voting on posts
  post 'posts/:id' => 'posts#vote'
  # basic cruds:
  resources :categories, :posts, :users
end

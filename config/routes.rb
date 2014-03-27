Iwitness::Application.routes.draw do
  #home
  root :to => 'pages#index'
  # post 'index' => 'pages#index'
  # replaces the above to try deal with session search better
  post 'index' => 'session#index'
  #sessions
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  #get '/login' => 'session#destroy', :as => 'logout'
  #extra post returns - sorting
  get 'posts' =>'posts#index'

  get 'posts/all' =>'posts#all'
  post 'posts/all' =>'posts#all'
  # voting on posts
  
  post 'posts/:id' => 'posts#vote'
  # basic cruds:
  resources :categories, :posts, :users
end

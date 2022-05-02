Rails.application.routes.draw do

  get "search" => "searches#search"
  get 'relationships/followings'
  get 'relationships/followers'
  root :to =>"homes#top"
  devise_for :users

  get "home/about"=>"homes#about", as: "about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end

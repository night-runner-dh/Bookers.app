Rails.application.routes.draw do
  get 'books/new'
  get '/top' => 'homes#top'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  post 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  
  root :to => 'homes#top'
  
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
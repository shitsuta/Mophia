Rails.application.routes.draw do
  devise_for :users
  get  'mophia'       => 'mophia#index'
  get  'mophia/new'   => 'mophia#new'
  post 'mophia'       => 'mophia#create'
  root 'mophia#index'
  get  'users/:id'    => 'users#show'
  delete 'mophia/:id' => 'mophia#destroy'
  get 'mophia/:id/edit' => 'mophia#edit'
  patch 'mophia/:id' => 'mophia#update'
  get 'mophia/postpage/:id' => 'mophia#page'
  post 'mophia/postpage/answer/' => 'mophia#answerCreate'
end

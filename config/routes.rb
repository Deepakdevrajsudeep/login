Rails.application.routes.draw do
  
  root to: 'main#index'                                                  #main controller
  get 'sign_up', to: 'registration#new'                                  #registration controller
  post 'sign_up', to: 'registration#create'                              #registration controller   
  get 'password', to: 'password#edit', as: :edit_password                #password controller
  patch 'password', to: 'password#update'                                #password controller
  # delete 'sign_in', to: 'registration#destroy'
  delete 'logout', to: 'sessions#destroy'                                #sessions controller 
  get 'sign_in', to: "sessions#new"                                      #sessions controller
  post 'sign_in', to: "sessions#create"                                  #sessions controller
  get 'about', to:'about#index'                                          #about controller 
  get 'password/reset', to: 'password_resets#new'                        #password_resets
  post 'password/reset', to: 'password_resets#create'                    #password_resets
  get 'password/reset/edit', to: 'password_resets#edit'                  #password_resets
  patch 'password/reset/update', to: 'password_resets#update'            #password_resets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

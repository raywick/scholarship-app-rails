Rails.application.routes.draw do
  root 'home#index'
  
  # ADMIN ROUTES
  # See all the applications a specific user has
  get 'applications/user/:user_id', to: 'applications#from_applicant'
  # Show all the personal information of a specific user
  get 'user/:id', to: 'users#show', as: :user
  # Generates routes to see all the users list and generates the route necessary to edit their profile picture
  resources :users, only: [:index, :update]
  # Let admins edit Users information destroy a user account  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #get 'admin/user/:id/edit', as: 'rails_admin_edit_user'

  # APPLICATIONS ROUTES
  # Generates all the other necessary routes
  resources :applications

  # USER ROUTES
  # Lets user change profile picture and see their personal information
  get 'perfil', to: 'users#edit'
  # Let users see their current applications
  get 'myapplications', to: 'applications#my_applications'
  # Generates the authentication routes
  devise_for :users

  # CAREER ROUTES
  resources :careers

  # SCHOLARSHIP ROUTES
  resources :scholarships
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

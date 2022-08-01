Rails.application.routes.draw do
  get 'footer/terms'
  get 'footer/politics'
  get 'student_contact/index'
  get 'student_contact/success'
  get 'student_contact/index'
  #post 'student_contact/index/:id', to: 'student_contact#index'
  devise_for :students
  resources :posts
  resources :students do
    member do
      post :upload_image
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

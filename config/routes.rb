Rails.application.routes.draw do
  resources :documents

  devise_for :admins

  get "admins/menu" => "admins#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # In order to route the root page as the Admin's sign in page (RSB, 2013), 
  # http://stackoverflow.com/questions/19855866/how-to-set-devise-sign-in-page-as-root-page-in-rails
  devise_scope :admin do
    root :to => 'devise/sessions#new'
  end

  devise_for :students, controllers: { registrations: "students/registrations" }

  namespace :students do
    resources :accounts
    get 'accounts/acknowledge_student/:id' => 'accounts#acknowledge_student', as: :accounts_acknowledge
    get 'accounts/acknowledge_fee/:id' => 'accounts#acknowledge_fee', as: :accounts_acknowledge_fee
  end

  namespace :api do
    devise_scope :student do
      post 'sessions' => 'sessions#create', as: :student_login
      delete 'sessions' => 'sessions#destroy', as: :student_logout
    end
    post 'tasks' => 'tasks#index', :as => 'tasks'
  end
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

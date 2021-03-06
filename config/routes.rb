Webcasting::Application.routes.draw do
  resources :posts


  devise_for :users, :controllers => {:registrations => "registrations"}

  #resources :user

  match 'user/:id/' => 'users#show', :as => :user
  match 'search/' => 'users#search', :as => :search
  match 'favourites/' => 'users#favourites', :as => :favourites
  match 'inbox/' => 'users#inbox', :as => :inbox
  match 'blackboard' => 'posts#index', :as => :black_board
  match 'user/:id/message' => 'users#new_message', :as => :message
  match 'user/:id/show_message' => 'users#show_message', :as => :show_message

  match '/users/password/new' => 'devise/passwords#new', :as => :new_user_password
  match 'conversation/:id/addForm' => 'conversations#addForm', :as => :addForm

  match 'user/:id/like' => 'users#like', :as => "like"
  match 'user/:id/unlike' => 'users#unlike', :as => "unlike"

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'users#search'


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

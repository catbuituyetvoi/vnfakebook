Rails.application.routes.draw do


  get 'profile/show'

  get 'profile/:id' => 'profile#show', as: :show_profile

  delete 'status/delete'

  post 'status/update'

  post 'relation/sendFriend/:id' => 'relation#send_friend_request', as: :send_friend_request

  post 'relation/acceptFriend/:id' => 'relation#accept_friend_request', as: :accept_friend_request

  post 'relation/denyFriend/:id' => 'relation#deny_friend_request', as: :deny_friend_request

  post 'follow/:id' => 'relation#follow_user', as: :follow_user

  post 'post/like/:id' => 'post#like', as: :like_post

  get 'friend/:id' => 'relation#get_friend_list', as: :show_friend

  get 'status/destroy'



  post 'status/create'

  get 'gettingstarted' => 'profile#getting_started', as: :gettingstarted_profile

  post 'upload/avatar' => 'profile#upload_avatar'

  devise_for :users, :path_names => {:sign_in => 'login', :sign_out => 'logout',:sign_up => 'signup' },:controllers => { :registrations => "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

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

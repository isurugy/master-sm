Rails.application.routes.draw do
  resources :prd_tags
  get 'csl_admin/index'

  resources :usr_vendor_properties do
    collection do
      get 'additional_signup'
      get 'sign_in'
    end
  end
  patch 'usr_vendor_properties/update'

  get 'usr_role/index'

  post 'usr_role/create'
  get 'prd_items/apple'
  get 'prd_items/get_types'
  get 'prd_items/get_type_id'
  get 'prd_items/add_to_cart'
  get 'prd_items/get_cart_count'
  get 'prd_items/get_subcat_id'


  root 'prd_items#index'

  devise_for :usr_contacts, :controllers => { registrations: 'usr_registrations', omniauth_callbacks: 'omniauth_callbacks' }

  devise_scope :usr_contacts do
    get '/usr/index' => "usr#index"
    get '/usr/register' => "usr#register"
  end

  #UsrBuyer Routes
  get 'usr_buyer/index'
  get 'usr_buyer/new'
  get 'usr_buyer/edit'
  patch 'usr_buyer/create'
  patch 'usr_buyer/update'
  post 'usr_buyer/destroy'
  
  #UsrVendor Routes

  
 
   
  # resourceful route for usr_roles controller
  resources :usr_roles


  #resourceful rout for usr_buyer_properties
  resources :usr_buyer_properties
  put 'usr_buyer_properties/update'

  # resourceful route for prd_commons controller
  resources :prd_items do
    collection do
      get 'apple'
      get 'get_variation_list'
      get 'get_subcat_fields'
      get 'set_selected_types'
      get 'get_category_name'
      get 'get_type_breadcrumb'
    end
  end

  # resourceful route for csl_admin controller
  resources :csl_admin

  # resourceful route for usr_permissions controller
  resources :usr_permissions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

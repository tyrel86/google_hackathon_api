GoogleHackathonApi::Application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :centers
			resources :pages
			resources :users, only: [:show] do
				member do
					post "update_last_location"
				end
				collection do
					get "create" => "users#create"
					get "update" => "users#create"
					match "search", via: [:get, :post]
				end
			end
			resources :custom_fields
			resources :vendors
			resources :user_vendor_statuses
		end
	end
end

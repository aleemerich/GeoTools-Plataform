ApiArichComBr::Application.routes.draw do
	namespace :alfa do
		namespace :v1 do
			resources :companies
			resources :users
			resources :settings
			resources :authentications
			resources :worktables
			resources :layers
			resources :templates
			resources :scripts
			resources :script_details
			get 'layers/companies/:id', :to => 'layers#companies'
		end
	end
end
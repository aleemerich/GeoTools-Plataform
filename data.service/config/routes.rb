GeoduopoDataArichComBr::Application.routes.draw do
  namespace :alfa do
    resources :tables
    get 'query', :to => 'xxxx'
  end
end

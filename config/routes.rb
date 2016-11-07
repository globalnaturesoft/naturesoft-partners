Naturesoft::Partners::Engine.routes.draw do
  namespace :backend, module: "backend", path: "backend/partners" do
    resources :partners do
      collection do
        put ':id/enable' => 'partners#enable', :as => 'enable'
        put ':id/disable' => 'partners#disable', :as => 'disable'
      end
    end
    
    # Setting page
    get 'settings' => 'options#index', :as => :options
  end
end
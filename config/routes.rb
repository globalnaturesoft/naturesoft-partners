Naturesoft::Partners::Engine.routes.draw do
  namespace :admin, module: "admin" do
    resources :partners do
      collection do
        put ':id/enable' => 'partners#enable', :as => 'enable'
        put ':id/disable' => 'partners#disable', :as => 'disable'
      end
    end
  end
end
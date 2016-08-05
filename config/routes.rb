Naturesoft::Partners::Engine.routes.draw do
  namespace :admin, module: "admin" do
    resources :partners
  end
end
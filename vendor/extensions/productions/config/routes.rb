Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :productions do
    resources :productions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :productions, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :productions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

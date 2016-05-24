Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :contacts do
    resources :contacts, :path => '', :only => [:index, :show]
    post :send_contact, to: 'contacts#send_contact'
    get :contact_sent, to: "contacts#contact_sent"
  end

  # Admin routes
  namespace :contacts, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :contacts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

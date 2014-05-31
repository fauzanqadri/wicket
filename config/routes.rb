require 'sidekiq/web'
require 'sidetiq/web'
Rails.application.routes.draw do

  default_url_options host: ENV['APP_HOST']
  devise_for :accounts, skip: [:sessions, :registrations], controllers: {passwords: "passwords"}
  devise_scope :account do
    get '/login' => 'devise/sessions#new'
    post '/login' => 'devise/sessions#create'
    delete '/logout' => 'devise/sessions#destroy'
    get '/accounts/edit' => 'devise/registrations#edit', as: "edit_account_registration"
    put "/accounts/:id" => "devise/registrations#update", as: "account_registration"
  end

  authenticate :account, lambda {|u| u.role == "SUPERADMIN" } do
    mount Sidekiq::Web => "/sidekiq"
    namespace :admin do
      resources :journals, except: :show do
        resources :journal_accounts, except: :show do
          with_options action: "set_status" do |map|
            map.post '/enable', action: "set_status"
            map.post '/disable', action: "set_status"
          end
        end
      end
      resources :account
    end
  end

  constraints subdomain: 'api' do
    namespace :api, path: '/' do
      with_options only: :index do |map|
        map.resources :journals do
          get "/cookies", action: "get_cookies", on: :member
        end
        map.resources :account, controllers: "api/account"
      end
    end
  end

  authenticate :account, lambda {|u| u.role == "SUPERADMIN" || u.role == "ADMIN"} do
    namespace :admin do
      resources :posts do
        with_options on: :member, action: 'change_status' do |map|
          map.post '/publish'
          map.post '/unpublish'
        end
      end
    end
  end

  get '/journal_status' => 'static_pages#journal_status'
  get '/sign_in_status' => 'static_pages#sign_in_status'
  resources :posts, only: [:index, :show]
  root "static_pages#index"
end

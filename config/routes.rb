Rails.application.routes.draw do

  root 'home#index'
  resources :restaurants, shallow: true do
    collection do
      get :search
      get :search_results
    end

    resources :menus do
      resources :selections
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

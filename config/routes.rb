Rails.application.routes.draw do
  resources :products do
    resources :vulnerabilities do
      member do
        get :resolve
      end
    end
  end

  root 'products#index'
end

Rails.application.routes.draw do
  scope module: :web do
    get 'welcome/index'

    resources :articles do
      scope module: :articles do
        member do
          patch :moderate
        end
        resources :comments
      end
    end

    root 'welcome#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

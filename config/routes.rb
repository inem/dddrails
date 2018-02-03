Rails.application.routes.draw do
  scope module: :web do
    get 'welcome/index'

    namespace :moderation  do
      resources :articles, only: [:index, :edit, :update, :show] do
        member do
          patch :publish
        end
      end
    end

    resources :articles do
      member do
        patch :moderate
      end

      scope module: :articles do
        resources :comments
      end
    end

    root 'welcome#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

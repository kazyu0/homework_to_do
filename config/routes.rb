Rails.application.routes.draw do
  root "homeworks#index"
  devise_for :users
  resources :homeworks do
    member do
      patch :toggle_status
    end
  end
end
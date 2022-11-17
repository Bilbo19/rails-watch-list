Rails.application.routes.draw do
  resources :bookmarks do
    resources :bookmark, only: [:new, :create, :destroy]
  end
  resources :list, only: [:index, :show, :new, :create]
end

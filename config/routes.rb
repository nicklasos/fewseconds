Fewseconds::Application.routes.draw do
  resources :issues do
    member do
      post 'answer'
    end
  end

  devise_for :users

  root to: 'issues#index'
end

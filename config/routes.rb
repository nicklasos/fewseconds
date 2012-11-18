Fewseconds::Application.routes.draw do
  resources :issues

  devise_for :users

  root to: "issues#index"
end

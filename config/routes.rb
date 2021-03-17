Rails.application.routes.draw do
  resources :events do
    get :rollup, on: :collection
  end
end

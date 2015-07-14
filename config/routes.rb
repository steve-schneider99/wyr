Rails.application.routes.draw do
  root to: "questions#index"

  devise_for :users
  resources :questions do
    member do
      put "like", to: "questions#upvote"
      put "dislike", to:"questions#downvote"
  end
end
end

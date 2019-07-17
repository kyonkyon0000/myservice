Rails.application.routes.draw do
  get "/" => "home#top" #トップ画面
  get "about" => "home#about" #サービスについて

  get "posts/index" => "posts#index" #投稿一覧
  get "posts/new" => "posts#new" #新規投稿画面
  post "posts/create" => "posts#create" #投稿ボタン押下時
  get "posts/:id" => "posts#show" #投稿詳細

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

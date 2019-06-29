Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :professors
      resources :alunos
      resources :projetos
      resources :aulas
      resources :publicacaos
    end
  end

  root to: "home#index"


  post "refresh", controller: :refresh, action: :create
  post "signin", controller: :signin, action: :create
  delete "signin", controller: :signin, action: :destroy

end

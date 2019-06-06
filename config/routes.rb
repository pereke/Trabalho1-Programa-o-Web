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
end

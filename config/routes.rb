Rails.application.routes.draw do
  resources :publicacaos
  resources :projetos
  resources :aulas
  resources :professors
  resources :alunos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

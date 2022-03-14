Agenda::Application.routes.draw do
  # get    '/usuarios',          to: 'usuarios#index',   as: :usuarios
  # get    '/usuarios/new',      to: 'usuarios#new',     as: :new_usuario
  # post   '/usuarios',          to: 'usuarios#create',  as: :usuarios
  # get    '/usuarios/:id',      to: 'usuarios#show',    as: :usuario
  # get    '/usuarios/:id/edit', to: 'usuarios#edit',    as: :edit_usuario
  # put    '/usuarios/:id',      to: 'usuarios#update',  as: :usuario 
  # delete '/usuarios/:id',      to: 'usuarios#destroy', as: :usuario 

  resources :usuarios

  # '/path' é o caminho na URL
  # antes da "#" é o nome do controller
  # o que vem após o "#" é a ação no controller
  # o as: :xxxx -> é o alias para o Rails, que representa a rota para o Rails
  get  '/login',  to: 'login#login',   as: :login
  post '/logar',  to: 'login#logar',   as: :logar
  get  '/logout', to: 'login#logout',  as: :logout

  root to: 'login#login'

  resources :contatos do 
    resources :telefones #ficam aninhados com os contatos
  end  
end

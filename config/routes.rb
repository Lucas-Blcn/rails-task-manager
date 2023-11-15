Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  #CREATE : CREER UNE NOUVELLE TACHE
  get "tasks/new", to: "tasks#new"
  post "tasks", to: "tasks#create"

  #READ : AFFICHER LES TACHES
    # READ : Afficher toutes les taches
    root to: "tasks#index"
    # READ : Afficher le détail d'une tache (id)
    get "/tasks/:id", to: "tasks#show", as: :task

  #UPDATE : MODIFIER UNE TACHE (id)
    get "/tasks/:id/edit", to: "tasks#edit", as: :edit_this_task
    patch "/tasks/:id", to: "tasks#update"

  #DELETE : SUPPRIMER UNE TACHE (id)
    delete "/tasks/:id", to: "tasks#destroy", as: :delete_this_task

  # Defines the root path route ("/")
  # root "posts#index"
end

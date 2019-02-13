Rails.application.routes.draw do
    root to:"pages#home"
    get 'about', to: 'pages#about'
    get 'developers', to: 'pages#developers'
    get 'investors', to: 'pages#investors'

end
    

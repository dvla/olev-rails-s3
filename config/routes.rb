Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'welcome/upload', to: 'welcome#upload'
  post 'welcome/upload_post', to: 'welcome#upload_post'

  root to: 'welcome#upload'

end

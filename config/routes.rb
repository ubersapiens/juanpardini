Rails.application.routes.draw do
  root 'welcome#index'
  get '/vitals', to: 'welcome#vitals'
  get '/craft', to: 'welcome#craft'
end

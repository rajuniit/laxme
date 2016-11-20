require 'sidekiq/web'
Rails.application.routes.draw do
  get 'index/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web, at: '/sidekiq'
  mount DelayedJobWeb => "/delayed_job"
  #match "/jobs" => Supervisor::App, :anchor => false
end

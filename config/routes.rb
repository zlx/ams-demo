Rails.application.routes.draw do
  concern :ams_jbuilder do
    get :ams, :jbuilder
  end

  namespace :users do
    concerns :ams_jbuilder
  end
  namespace :answers do
    concerns :ams_jbuilder
  end
  namespace :questions do
    concerns :ams_jbuilder
  end
end

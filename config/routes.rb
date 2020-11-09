Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/doctors/:doctor_id', to: 'doctors#show'
  delete '/doctors/:doctor_id/:patient_id', to: 'doctors#remove_patient'
  get '/hospitals/:hospital_id', to: 'hospitals#show'
  get 'patients', to: 'patients#index'
end

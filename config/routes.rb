Rails.application.routes.draw do

get '/competitions',               to: 'competitions#index'
get '/competitions/:id',           to: 'competitions#show'
get '/competitions/:id/teams/new', to: 'teams#new'



end

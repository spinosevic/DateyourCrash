Rails.application.routes.draw do
post 'signup', to: 'users#signup'
post 'celebs', to: 'celebrities#seed'
get 'celebrities', to:'celebrities#index'
get 'celebsLong', to:'celebrities#long'
get 'usersmatch', to:'users#index'
put 'match', to: 'users#match'
post 'login', to: 'users#login'
post 'message', to: 'users#message'
get 'messages', to: 'users#messages'



end

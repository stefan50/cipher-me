Rails.application.routes.draw do
	get 'messages' => 'messages#new'
	resources :messages
	root 'messages#new'
	post 'messages/api' => 'messages#api'
end

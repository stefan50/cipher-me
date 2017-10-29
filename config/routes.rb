Rails.application.routes.draw do
	get 'messages' => 'messages#new'
	resources :messages
	root 'messages#new'
end

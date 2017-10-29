Rails.application.routes.draw do
	get 'messages' => 'messages#new'
	post 'messages' => 'messages#create'
	resources :messages
	root 'messages#new'
end

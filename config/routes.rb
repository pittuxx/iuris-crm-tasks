Iuris::Core::Engine.routes.draw do
	scope module: 'tasks' do
		resources :tasks
	end

	namespace :admin do
		resources :tasks, only: :index
	end
end
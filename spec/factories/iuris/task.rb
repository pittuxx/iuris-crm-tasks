require 'faker'

module Iuris::Tasks
	
	FactoryGirl.define do
		factory :contact do |f|
			first_name 'Mongorito'
			last_name 'Flores'
			f.email {Faker::Internet.email}
			company 'Chundulu Express'
			phone '666666666'
			comments 'Creando un contacto'
			user
		end
	end

	FactoryGirl.define do
		factory :task, class: 'Iuris/Tasks/task' do
			title 'titulo de la tarea'
			content 'contenido de la tarea'
			state 'pending'
			contact
			user
		end
	end
end
require 'spec_helper'

module Iuris::Tasks
	describe TasksController do
		set_engine_routes

		context 'user visits tasks path' do
			login_user

			describe 'GET tasks_path' do
				it 'should get :index' do
					get :index
					expect(response).to be_success
				end
				it 'shoud have a current_user' do
					expect(subject.current_user).to be_instance_of(Iuris::User)
					expect(subject.current_user).to_not be_nil
				end
				it 'renders the contacts#index' do
					get :index
					expect(response).to render_template :index
				end
				it 'has a current_user who is not admin' do
					expect(subject.current_user.admin).to be false
				end
			end
		end

		context 'guest visit contacts path' do
			describe 'GET index' do

				it 'should be redirected to login page' do
					get :index
					expect(subject).to redirect_to new_user_session_path
				end
				it 'does not have a current_user' do
					expect(subject.current_user).to be_nil
				end
			end
		end

		context 'admin visits contacts path' do
			login_admin
			describe 'GET index' do

				it 'has a current_user' do
					expect(subject.current_user).to_not be_nil
				end

				it 'has a current_user who is admin' do
					expect(subject.current_user.admin).to be true
				end

				it 'should be index' do
					get :index
					expect(response).to be_success
				end

				it 'renders the :index view' do
					get :index
					expect(response).to render_template :index
				end

				it 'admin can access other users tasks' do
					@task = FactoryGirl.create(:task, contact_id: 3)
					get :show, id: 1
					expect(response).to render_template :show
				end
			end
		end

		context 'CRUD' do
			login_user

			before(:each) do
				@task = FactoryGirl.create(:task, user_id: @user.id, contact_id: 3)
			end

			it 'can read' do
				get :show, id: 1
				expect(response).to render_template :show
			end

			it 'can update' do
				expect(@task.title).to eql 'titulo de la tarea'
    		expect(@task.content).to eql 'contenido de la tarea'
				put :update, :id => @task.id, :task => @task.attributes = { :title => "new title", :content => "new content" }
    		expect(response).to redirect_to(@task)
    		expect(@task.title).to eql 'new title'
    		expect(@task.content).to eql 'new content'
    		expect(Task.count).to eq(1)
			end

			it 'can delete' do
				delete :destroy, id: @task.id
				expect(Task.count).to eq(0)
			end
		end

		context 'cancancan' do
			describe 'testing cancancan authorization for user' do
				login_user

				it 'user cannot access other user tasks' do
					# :task is not created by @user, who is logged in
					FactoryGirl.create(:task, contact_id: 3)
					get :show, id: 1
					expect(response).to render_template 'static/403.html'
				end

				it 'user can access their contacts' do
					FactoryGirl.create(:task, user_id: @user.id, contact_id: 1)
					get :show, id: 1
					expect(response).to render_template :show
				end
			end

			describe 'testing cancancan authorization for user' do
				login_admin

				it 'admin can access other user contacts' do
					user = FactoryGirl.create(:user)
					FactoryGirl.create(:task, user_id: user.id, contact_id: 1)
					get :show, id: 1
					expect(response).to render_template :show
				end
			end
		end

	end
end
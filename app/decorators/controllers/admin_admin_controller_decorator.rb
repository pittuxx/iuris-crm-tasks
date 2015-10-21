Iuris::Admin::AdminController.class_eval do
	before_action :set_tasks, only: :index

	private

	def set_tasks
		@tasks = Iuris::Tasks::Task.ordered
	end	
end
module Iuris::Admin
	class TasksController < AdminController

		def index
			@tasks = Iuris::Tasks::Task.ordered
		end

	end
end
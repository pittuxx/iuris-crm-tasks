Iuris::User.class_eval do
	has_many :tasks, class_name: "Iuris::Tasks::Task"
end
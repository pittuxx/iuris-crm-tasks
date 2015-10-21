if Iuris::Core.avaiable?(:contacts)
	Iuris::Contacts::Contact.class_eval do
		has_many :tasks, class_name: "Iuris::Tasks::Task"
	end
end
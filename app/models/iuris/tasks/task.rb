module Iuris::Tasks
  class Task < ActiveRecord::Base
    belongs_to :user
    validates :user, presence: true, associated: true

    if Iuris::Core.avaiable?(:contacts)
    	belongs_to :contact, class_name: "Iuris::Contacts::Contact"
    end

    scope :ordered, -> {order('created_at desc')}
  end
end

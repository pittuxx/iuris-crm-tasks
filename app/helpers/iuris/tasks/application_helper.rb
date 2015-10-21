module Iuris
  module Tasks
    module ApplicationHelper
    	def icon_task
    		return '<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>'.html_safe
    	end

    	def icon_user
    		return '<span class="glyphicon glyphicon-user" aria-hidden="true"></span>'.html_safe
    	end

    	def icon_edit
    		return '<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>'.html_safe
    	end

    	def icon_trash
    		return '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>'.html_safe
    	end
    end
  end
end
#cambiar nombre a llos helpers para poder reusarlos...
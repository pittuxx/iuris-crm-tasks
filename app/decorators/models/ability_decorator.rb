require 'cancan'
module Iuris
	module Tasks
		class AbilityDecorator
			include CanCan::Ability

			def initialize(user)
				unless user.admin?
					can :manage, Iuris::Tasks::Task, user_id: user.id
				end
			end
		end
	end
end

Iuris::Ability.register_ability(Iuris::Tasks::AbilityDecorator)
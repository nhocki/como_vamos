module ProblemsHelper
	def without_problems
		unless controller.controller_name =~ /users/
			"There are no problems here yet, you can #{link_to "add one here", new_problem_path}.".html_safe
		end
	end
end

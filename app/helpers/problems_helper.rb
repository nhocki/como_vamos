module ProblemsHelper
  def without_problems
    unless controller.controller_name =~ /users/
      default_no_problems_text
    end
  end

  def default_no_problems_text
    add_link = link_to t('.add_link'), new_problem_path
    t('.no_problems', add_link: add_link).html_safe
  end
end


module UsersHelper
  def department_options
    Department.all.map{|s| [s.name,s.id]}
  end
end

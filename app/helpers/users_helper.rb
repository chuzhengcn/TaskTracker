module UsersHelper
  def dep_by_user(user)
    deps = []
    for dep in user.departments
      deps << dep.name
    end
    deps
  end
end

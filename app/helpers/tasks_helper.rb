module TasksHelper
  def state_options
    State.all.map{|s| [s.name,s.id]}
  end
  def task_user_by_dep(task,dep_id)
    users = []
    for u in task.users
      if u.department.id == dep_id
        users << u.name
     end 
    end
    users.join("+")
  end
end

module TasksHelper
  def state_options
    State.all.map{|s| [s.name,s.id]}
  end
  def task_user_by_dep(task,dep_id)
    users = []
    for u in task.users
     for i in u.departments
      if i.id == dep_id
        users << u.name
      end
     end 
    end
    users.join("+")
  end
end

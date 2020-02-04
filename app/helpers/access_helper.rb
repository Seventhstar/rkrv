module AccessHelper

  def allow_edit(object, date)
    if current_user.admin
      # return true
    end
    puts "object #{object}"
    class_name = object.class.name

    find = TimeRight.where(model: class_name, user_id: current_user.id) 
    find = TimeRight.where(model: class_name) if !find.length

    if find.length > 0
      days = find.first.days
      if date.beginning_of_day + days.day < Date.today.beginning_of_day 
        return false
      else
        return true
      end
    end

#    wekjlke
  end

end
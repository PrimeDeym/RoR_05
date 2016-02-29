require_relative 'developer.rb'

class JuniorDeveloper < Developer
  MAX_TASKS = 5
  PROF = :junior
  TEAM = :juniors
  
  def add_task(task)
    if task.size > 20
      raise(ArgumentError, "Слишком сложно!")
    else
      super
    end
  end

  def work!
    not_working
    puts %Q("%s: пытаюсь выполнить задачу "%s". Осталось задач: %i") %
          [@name, @tasks.shift, @tasks.count]

  end
end

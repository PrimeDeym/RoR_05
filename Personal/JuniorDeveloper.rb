require 'pry'
require_relative 'Developer.rb'

class JuniorDeveloper < Developer
  MAX_TASKS = 5
  def add_task(task)
    case
    when @tasks.count == MAX_TASKS
      raise(ArgumentError, "Слишком много работы!")
    when task.size > 20
      raise(ArgumentError, "Слишком сложно!")
    else
      super
    end
  end

  def work!
    if @tasks.empty?
      raise(ArgumentError, "Нечего делать!")
    else
      puts %Q("%s: пытаюсь выполнить задачу "%s". Осталось задач: %i") %
           [@name, @tasks.shift, @tasks.count]
    end
  end

end

#binding.pry
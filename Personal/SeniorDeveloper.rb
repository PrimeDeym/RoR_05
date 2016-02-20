require 'pry'
require_relative 'Developer.rb'

class SeniorDeveloper < Developer
  MAX_TASKS = 15
  def add_task(task)
    if can_add_task?
      @tasks.push(task)
      puts %Q("%s: добавлена задача "%s". Всего в списке задач: %i") %
           [@name, task, @tasks.count]
    else
      raise(ArgumentError, "Слишком много работы!")
    end
  end
  
  def work!
    if @tasks.empty?
      raise(ArgumentError, "Нечего делать!")
    elsif @tasks.size == 1
      puts %Q("%s: выполнена задача "%s". Осталось задач: %i") %
           [@name, @tasks.shift, @tasks.count]
    elsif rand > 0.6
      puts %Q("%s: выполнена задача "%s и %s". Осталось задач: %i") %
           [@name, @tasks.shift, @tasks.count]
    else
      puts 'Что-то лень'
    end
  end

  def can_add_task?
    @tasks.count < MAX_TASKS
  end
end

#binding.pry
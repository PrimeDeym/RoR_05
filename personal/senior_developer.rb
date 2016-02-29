require_relative 'developer.rb'

class SeniorDeveloper < Developer
  MAX_TASKS = 15
  PROF = :senior
  TEAM = :seniors
  

  def work!
    if @tasks.size <= 1
      super
    elsif rand > 0.4
      puts %Q("%s: выполнена задача "%s и %s". Осталось задач: %i") %
             [@name, @tasks.shift, @tasks.shift, @tasks.count]
    else
      puts 'Что-то лень'
    end
  end
end


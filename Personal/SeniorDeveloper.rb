require 'pry'
require_relative 'Developer.rb'

class SeniorDeveloper < Developer
  MAX_TASKS = 15

  def work!
    not_working
    if @tasks.size == 1
      super
    elsif rand > 0.5
      puts %Q("%s: выполнена задача "%s и %s". Осталось задач: %i") %
             [@name, @tasks.shift, @tasks.shift, @tasks.count]
    else
      puts 'Что-то лень'
    end
  end
end

#binding.pry
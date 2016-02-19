require 'pry'
require_relative 'Developer.rb'

class SeniorDeveloper < Developer
  MAX_TASKS = 15
  def add_task(task)
    if @tasks.count == MAX_TASKS
      raise(ArgumentError, "Слишком много работы!")
    else
      super
    end
  end
  
  def work!
    case rand(2)
    when 0 then puts "Что-то лень"
    when 1 
      puts %Q(%n: выполнена задача "%d" "%d". Осталось задач: %c")
      [@name, @tasks.delete_at(0), @tasks.count]
    else   
      super
    end    
  end








  # def work!
  #   if @tasks.empty? 
  #     raise(ArgumentError, "Нечего делать!")
  #   elsif @tasks.size == 1
  #     puts %Q("#{@name}: выполнена задача "#{@tasks.delete_at(0)}". Осталось задач: #{@tasks.count}")
  #   end
      
  #   case rand(2)
  #   when 0 then puts "Что-то лень"
  #   when 1 
  #     puts %Q("#{@name}: выполнена задача "#{@tasks.delete_at(0)}" "#{@tasks.delete_at(0)}". Осталось задач: #{@tasks.count}")
  #   else   
  #     puts  
  #   end
  # end
end

#binding.pry
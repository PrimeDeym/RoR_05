require 'pry'

class SeniorDeveloper < Developer
  def add_task(task)
    @tasks.push(task)
    if @tasks.count == MAX_TASKS + 5
      raise(ArgumentError, "Слишком много работы!")
    else
      puts %Q("#{@name}: добавлена задача "#{task}". Всего в списке задач: #{@tasks.count}")
    end
  end
end

#binding.pry
require 'pry'

class Developer
  #нужно доработать метод с константой
  MAX_TASKS = 10
  def max_tasks
    self.class::MAX_TASKS
  end

  def initialize(name)
    @name = name
    @tasks = []
  end
	
  def add_task(task)
    @tasks.push(task)
    if @tasks.count == MAX_TASKS
      raise(ArgumentError, "Слишком много работы!")
    else
      puts %Q("#{@name}: добавлена задача "#{task}". Всего в списке задач: #{@tasks.count}")
    end
  end

  def tasks
    @tasks.each_with_index { |a, i| puts "#{i+1}. #{a.capitalize}"}
  end

  def work!
    done = @tasks.shift
    unless done
      raise(ArgumentError, "Нечего делать!")
    else
      puts %Q("#{@name}: выполнена задача "#{done}". Осталось задач: #{@tasks.count}")
    end
  end

  def status
    case @tasks.count
    when 0 then puts "свободен"
    when 1..9 then puts "работаю"
    when 10 then puts "занят"
    end
  end

  def can_add_task?
    @tasks.count < MAX_TASKS
  end

  def can_work?
    @tasks.count >= 1
  end
end

#binding.pry
require 'pry'

class Developer
  MAX_TASKS = 10
  #нужно доработать метод с константой
  def max_tasks
    self.class::MAX_TASKS
  end

  def initialize(name)
    @name = name
    @tasks = []
    
  end
	
  def add_task(task)
    if can_add_task?
      @tasks.push(task)
      puts %Q("%s: добавлена задача "%s". Всего в списке задач: %i") %
           [@name, task, @tasks.count]
    else
      raise(ArgumentError, "Слишком много работы!")
    end
  end

  def tasks
    @tasks.each_with_index {|a, i| puts "#{i+1}. #{a.capitalize}"}
    if @tasks.empty?
      puts "Нет задач для выполнения"
    end
  end

  def work!
    if can_work?
      raise(ArgumentError, "Нечего делать!")
    else
      puts %Q("%s: выполнена задача "%s". Осталось задач: %i") %
           [@name, @tasks.shift, @tasks.count]
    end
  end

  def status
    if @tasks.empty?
      puts 'свободен'
    elsif can_add_task?
      puts 'работаю'
    else
      puts 'занят'
    end
  end
#если нет заданий true, потом false
  def can_add_task?
    @tasks.count < MAX_TASKS
  end
#если нет заданий то false, остальное true
  def can_work?
    @tasks.count >= 1
  end
end

#binding.pry
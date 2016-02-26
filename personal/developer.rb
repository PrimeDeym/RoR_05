class Developer
  MAX_TASKS = 10

  def max_tasks
    self.class::MAX_TASKS
  end

  def initialize(*name)
    @name = name
    @prof = PROF
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
    @tasks.map.with_index { |t, i| "#{i + 1}. #{t}" }.join("\n")
  end

  def work!
    check_can_work!
    puts %Q("%s: выполнена задача "%s". Осталось задач: %i") %
           [@name, @tasks.shift, @tasks.size]   
  end

  def check_can_work!
    unless can_work?
      raise(ArgumentError, "Нечего делать!")
    end
  end

  def status
    if @tasks.empty?
      'свободен'
    elsif can_add_task?
      'работаю'
    else
      'занят'
    end
  end

  def can_add_task?
    @tasks.size < max_tasks
  end

  def can_work?
    @tasks.size >= 1
  end
end

#binding.pry
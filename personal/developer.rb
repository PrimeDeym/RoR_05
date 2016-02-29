class Developer
  MAX_TASKS = 10
  PROF = :developer
  TEAM = :developers

  attr_reader :name, :tasks, :prof


  def initialize(name)
    @name = name
    @prof = prof
    @team = team
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
    @tasks.each_with_index { |t, i| "#{i + 1}. #{t}" }.join(", ")
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

  def prof
    self.class::PROF
  end

  def team
    self.class::TEAM
  end

  def max_tasks
    self.class::MAX_TASKS
  end
end


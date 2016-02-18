require 'pry'

class Developer
  MAX_TASKS = 10
  def initialize(name)
    @name = name
		
  end
	
  def add_task(task)
    puts %Q("#{@name}: добавлена задача "#{task}". Всего в списке задач: ")
		
  end
end

d = Developer.new('Test_Dev')
binding.pry
require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

class Team
  attr_reader :all, :name, :options

  def initialize(&block)
    @juniors = []
    @developers = []
    @seniors = []
    @all = []
    # @filters = []
    @options = {}
    instance_eval &block
  end
  
  def have_juniors(*names)
    @juniors = names.map! { |name| make_dev(JuniorDeveloper, name) }
    @all << @juniors
  end

  def have_developers(*names)
    @developers = names.map { |name| make_dev(Developer, name) }
    @all << @developers
  end

  def have_seniors(*names)
    @seniors = names.map { |name| make_dev(SeniorDeveloper, name) }
    @all << @seniors
  end

  def make_dev(type, name)
    type.new(name)
  end

  def priority(*list)
    @priority = list
  end

  def report
    dev_all.each { |dev|  puts "#{dev.name} (#{dev.prof}): #{dev.tasks}" }
  end

  def add_task(task, **options)   
    @options = options
    @options
    if @options.empty?
      dev_all.at(0).add_task(task)
    elsif @options.include?(:to)
      name = dev_all.select { |dev| @options.key(dev.name) }
      name.at(0).add_task(task)                                                                                                
        
    else
      developer = dev_all.select { |dev| @options.key(dev.prof) }
      developer.at(0).add_task(task)
    end
  end

  def on_task(prof, &block)
    # @filters[prof] = block
    # instance_eval &block
  end

  def dev_all
    @all.flatten.sort_by { |dev| [dev.tasks.size, @priority.index(dev.team)] }
  end


end
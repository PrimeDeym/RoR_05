require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

class Team
  attr_reader :all

  def initialize(&block)
    instance_eval &block
    @all = []
  end

  # def all
  #   puts " Seniors #{@seniors}"
  #   puts " Developers #{@developers}"
  #   puts " Juniors #{@juniors}"
  # end

  def have_seniors(*names)
    @seniors = names
  end
  
  def seniors
    @all.push(@seniors.map { |name| SeniorDeveloper.new(name) })
  end
end

#binding.pryy
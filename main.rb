require 'pry'
require_relative 'Personal/Developer'
require_relative 'Personal/JuniorDeveloper'
require_relative 'Personal/SeniorDeveloper'



d = Developer.new('Developer')
j = JuniorDeveloper.new('Junior')
s = SeniorDeveloper.new('Senior')


binding.pry
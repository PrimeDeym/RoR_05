require 'pry'

x_point, y_point, x_user, y_user = ARGV

case
when (ARGV.length < 4 or ARGV.length > 4)
	puts "Неправильно введены данные, введите 4 числа"

when (x_point == x_user and y_point == y_user)
	puts "Точка найдена!"

when (x_point != x_user and y_point != y_user)
	puts "Близко, но нет"

when (x_point == x_user and y_point != y_user)
	puts "X координата верна, Y нет"

when (x_point != x_user and y_point == y_user)
	puts "Y координата верна, X нет"

else 
 	puts "Unexpected Error!"
end

#binding.pry
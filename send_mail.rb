require "pony"
require "io/console"

my_mail = "jxipxyszahag@gmail.com"

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
password = STDIN.noecho(&:gets).chomp

puts "Кому отправить письмо?"
send_to = STDIN.gets.chomp

puts "Что написать в письме?"
body = STDIN.gets.chomp

Pony.mail({
	:subject => "привет из руби!",
	:body => body,
	:to => send_to,
	:from => my_mail,
	# Ниже идут опции класса Pony для почтового ящика на Mail.ru
	:via => :smtp,
	:via_options => {
				:adress => 'smtp.mail.ru', # это хост, сервер отправки почты
				:port => '465', # порт
				:tls => true, # если сервер работает в режиме TLS
				:user_name => my_mail, # используем наш адрес почты как логин
				:password => password, # задаем введенный в консоли пароль
				:authentication => :plain # "обычный" тип авторизации по паролю
			}
}

		)

puts "Письмо успешно отправлено!"

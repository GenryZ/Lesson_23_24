require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
get '/' do
	erb "Hello there <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School!!!</a>"			
end

get '/about' do
	@error = 'something wrong!!!'
	erb :about
end

get '/visit' do
	erb :visit
end

get '/author' do
	erb :author
end
get '/contacts' do
	erb :contacts
end
get '/admin' do
  	erb :admin
end
post '/visit' do 
	@user_name = params[:username]
	@phone = params[:phone]
	@date_time = params[:datetime]
	@walter = params[:barbers]
	@color = params[:color]
	
	if @user_name == ""
		@error = "Enter your name"
		return erb :visit
	end
	
	@t = Time.now
	f = File.open './public/user.txt', 'a'
	f.write "Time: #{@t} User: #{@user_name}, Phone: #{@phone}, Date: #{@date_time}, Barber: #{@walter}, Color: #{@color}\n"
	f.close
	erb :message	
end
post '/contacts' do 
	@email = params[:email]
	@message = params[:message]
	f = File.open './public/contacts.txt', 'a'
	f.write "Email user: #{@email}\nMessage: #{@message}\n"
	f.close
	erb :message_2	
end
post '/admin' do 
	@login = params[:login]
	@pass = params[:password]
	
	if @login == "admin" && @pass == "secret"
		@file = File.open("./public/user.txt", "r")
	erb :result
	else 
	@report = '<p><h1>Access denied</h1></p>'
	erb :admin
	end
end

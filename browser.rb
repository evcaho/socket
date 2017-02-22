require 'socket'
 
host = 'localhost'     # The web server
port = 2000                      # Default HTTP port
path = "index.html"                 # The file we want 
data = {"viking" => {:name => "name", :email => "email"}}

puts "What type of request do you want to make? Enter GET or POST"
user_input = gets.chomp
 if user_input.upcase == "POST"
 	puts "whats your name?"
 	data["viking"][:name] = gets.chomp
 	puts "what's your email?"
 	data["viking"][:email] = gets.chomp
 	puts data

 end

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

post = "POST /thanks.html HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2) 
puts headers
print body                         
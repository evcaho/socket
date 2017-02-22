require 'socket'

hostname = 'localhost'
port = 2000

connection = TCPSocket.open(hostname, port)

connection.puts("Here's a client piece of code!")
while line = connection.gets
	puts line.chop
end
connection.close
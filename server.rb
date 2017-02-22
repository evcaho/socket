require 'socket'             

server = TCPServer.open(2000)  
loop {                         
  client = server.accept

  request = client.gets.split()
  puts request[0]
  if request[0] == "GET"
	path = request[1]
	if File.exist?(path)
		client.puts "HTTP/1.1 200 OK"
	end
  end


  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}
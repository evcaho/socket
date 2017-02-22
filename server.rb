require 'socket'             

server = TCPServer.open(2000)  
loop {                         
  client = server.accept

  request = client.gets.split()
  if request[0] == "GET"
	path = request[1]
	if File.exist?(path)
		client.puts "HTTP/1.1 200 OK"
		lines = File.readlines(path)
		client.puts(lines)
		client.puts(File.size(path))
	else
		client.puts "HTTP/1.0 404 Not Found"
	end

  end


  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}

require 'socket'
require 'json'
require 'benchmark'
require_relative './Modules/check_balance.rb'
server = TCPServer.open(2000)

# This program prints messages recieved from clients
# It has its own thread
Thread.new {

  while true

    client = server.accept # Accept client
    response = client.gets

# puts response

    # Getting the block number
    file_1 = File.open("Block_Number.txt", "rb")
    block_number = file_1.read
    # Close the file after use
    file_1.close


the_data = response.split(",")

if the_data[0] == "Wallet"
  puts "Sending coins"

#  enough = check_balance
#  puts enough

  puts the_data[1]
  puts the_data[2]
  puts the_data[3]
  puts ""

    # Replace block number with new block number

    my_file_name = "./Blockchain/Block" + block_number.chomp + ".txt"
    # puts "here: " + my_file_name

    open(my_file_name, 'a') do |f|
      f.puts response
    end

    # Add to current block
    #open("./Blockchain/Block_"+block_number+".txt", "w+") do |f|
    #  f.puts "test" #response
    #end

elsif the_data[0] == "Smart_Contract"

  puts "Smart_Contract"

else

  puts "Block Found"
  puts the_data[0] # The String used to derrive the Hash
  puts the_data[1] # The Hash
  puts the_data[2]
  puts ""

    puts block_number
    new_block_number = block_number.to_i + 1

    # Delete old block number
    File.truncate("./Block_Number.txt", 0)

    # The number of the newest block
    open("./Block_Number.txt", 'a') do |f|
      f.puts new_block_number
    end

    puts "new Block Number" + new_block_number.to_s


    # Create a new block
    #open("./Blockchain/Block_" + block_number.to_s + ".txt", 'a') do |f|
    #  f.puts response
    #end

    #File.open("Block" + new_block_number.to_s + ".txt", "w+") {|f| f.write("write your stuff here") }
    puts "make a new file"

    File.open("./Blockchain/Block" + new_block_number.to_s  + ".txt", "w") do |f|
      f.write(response)
    end


end

    # write the response to Blockchain
    # need to verify the response before adding to blockchain

    # check the hash works and check its a new block



  end

}

  # this code runs in a seperate thread
  while true
    sleep 1
  end


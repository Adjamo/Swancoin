

require 'socket'
require_relative './Modules/Create_Addresses_Send_and_Recieve.rb'
require_relative './Modules/Make_Keys.rb'

# This creates send and recieve addresses if they haven't been made
# if they have then it prints the receiving address to the prompt

wallet = create_addresses

# This checks first if your participating in the Memeconomy
def send_coins

  input_1 = gets
  input_1 = input_1.chomp

  if input_1 == "h" or input_1 == "H"
    puts "Trying handshake"


    # Run a server
    # Recieve a message

    return nil
  end

  if input_1 == "b" or input_1 == "B"
    puts "You have decided to buy a meme!"

    
    wallet = create_addresses

    # send a meme message to the TCP server

      msg_2 = "Meme,3," + wallet
      client = TCPSocket.open('localhost', 2000)
      client.puts msg_2      # need to send a_string and wallet_address as well
      client.close;

    return nil
  end
  
  puts "Sending coins"


  # If user wants to send coins
  
    puts "Paste Recipient Address, or 'x' to cancel"

    input_2 = gets
    input_2 = input_2.chomp

    if input_2 == "x" or input_2 == "X"
      puts "Cancelled"
      return nil
    end

    puts "Number of coins to send"
    input_3 = gets
    input_3 = input_3.chomp

    puts "Transferring " + input_3 + " coins to:"
    puts input_2
    puts "Sending Coins from your address:"

    wallet = create_addresses
    puts wallet

      msg_2 = "Wallet," + input_2.to_s + "," + input_3.to_s + "," + wallet
      client = TCPSocket.open('localhost', 2000)
      client.puts msg_2      # need to send a_string and wallet_address as well
      client.close;

    puts "Sent"

    # Now send a message to a server to place the transaction on the ledger
    # the next time a block is found


end

# old code
# my_recieve_addr = File.read("./Receive_Address.txt")

# Get recieve address
my_recieve_addr = make_keys

puts ""
puts "Your coins recieving address"
puts my_recieve_addr
puts "Press 'Enter' to send coins"

send_coins


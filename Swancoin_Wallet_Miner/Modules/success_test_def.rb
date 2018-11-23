
# This function searches for a string of integers eg "333" or "555" depending
# on the difficulty, i.e. if difficulty is 2 it will search for "00", "11", "22"
# and so on

require 'socket'
require 'json'

# If a block is found it prints "Block found!! (yay!)"
def success_test(a_hash, diff, a_string, json) # diff added

  difficulty = diff
  i=0

  10.times{

    # to_s = to string
    searching_for_init = i.to_s 
    searching_for = ""

    diff.times{searching_for = searching_for + searching_for_init}

    if a_hash.include? searching_for

      puts "Block found! (yay!)"
      # need the block, the string, and wallet address
      
      client = TCPSocket.open('localhost', 2000)
      client.puts json      # need to send a_string and wallet_address as well
      client.close;
      puts "Added your Block to the Blockchain"      

      return nil

    end
  
    i+=1 

  }

end


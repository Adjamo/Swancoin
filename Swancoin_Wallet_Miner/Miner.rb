

# This is the miner, which mines hashes for blocks

# digest is for Sha256

require 'digest'
require_relative './Modules/success_test_def.rb'
require_relative './Modules/Make_Keys.rb'

# Crunch numbers, returns a random hash
def dave(new_str)
  new_hash = Digest::SHA256.hexdigest new_str
  return new_hash
end

# Generate a Random string
def ran_str_maker
  length = 10
  ran_str = rand(36**length).to_s(36)
  return ran_str
end

# Now we create hashes and test them for patterns we desire
loop do

  the_string = ran_str_maker

  # This tests the string for success criteria 
  the_hash = dave(the_string)
  puts the_hash

  rec_addr = get_pub_key

  # Place the string the hash and the rec_addr on one line
  all_data = the_string + "," + the_hash + "," + rec_addr

  # success_test(the hash to be tested, difficulty)
  success_test(the_hash, 3, the_string, all_data)

  sleep 1

end













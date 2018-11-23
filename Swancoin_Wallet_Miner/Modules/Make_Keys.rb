
require 'openssl'
require 'base64'

# This code generates a recieving address
# a public key and a private key

def get_pub_key

  # TODO Still in progress,
  # need to make public key one line of text
  one_line_pub = 
     $full_pub.to_s[27..90] +
     $full_pub.to_s[92..155] +
     $full_pub.to_s[157..220] +
     $full_pub.to_s[222..285] +
     $full_pub.to_s[287..350] +
     $full_pub.to_s[352..415] +
     $full_pub.to_s[417..424]

  # puts ""
  # puts "Pub Key: " + one_line_pub
  # comment not needed
  #  puts $full_pub.to_s
  
  return one_line_pub

end

def generate_keys

  key = OpenSSL::PKey::RSA.generate(2048)

  pri_key = key
  pub_key = key.public_key

  full_key = pub_key.to_s[92..156]
  #puts "public key: " + full_key

  # Now we have a wallet address made from private key
  puts "S" + full_key

  # now save the public and private keys to files!
  return key.public_key, key

end


def make_keys

  if File.exist?("./pub_key.txt")

    #Your Recieve Address (for coins)
    pub = File.read("./pub_key.txt")
    pri = File.read("./pri_key.txt")

    # puts "HERE"
    # puts pub
    $full_pub = pub.to_s
    $r_a = pub.to_s[92..156]
    # puts $r_a # recieve address

    return $r_a

  else

    # make a file and store recieving address in it

    the_hash, the_key = generate_keys()
    recieve_addr = the_hash

    # puts "Generated Receive Address (for coins)"
    # puts recieve_addr

    File.write("./pub_key.txt", recieve_addr)

    File.write("./pri_key.txt", the_key.to_s)

    # puts recieve_addr
    $r_a = pub_key.to_s[92..156]
    # puts $r_a # recieve address

    return $r_a

  end

end

make_keys


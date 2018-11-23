
def many_line_pub_key(one_line_public_key)

  many_line_public_key = 
    "-----BEGIN PUBLIC KEY-----" + "\n" +
    one_line_public_key.to_s[0..63] + "\n"  +
    one_line_public_key.to_s[64..127] + "\n" +
    one_line_public_key.to_s[128..191] + "\n" +
    one_line_public_key.to_s[192..255] + "\n" +
    one_line_public_key.to_s[256..319] + "\n" +
    one_line_public_key.to_s[320..383] + "\n" +
    one_line_public_key.to_s[384..391] + "\n" +
    + "-----END PUBLIC KEY-----"

  #many_line_public_key = one_line_public_key + " NEW LINE" +"\n" + "hello"

  # $full_pub.to_s[27..90] +
  # $full_pub.to_s[92..155] + "..."


  return many_line_public_key

end





# This will check the blokchain to find the exact balance of the wallet
def check_balance

line_num=0

File.foreach("../blockchain.txt").with_index do |line, line_num|

  my_string = "#{line}"
  if my_string.include? "cde"
    puts "String includes 'cde'"
  end

  puts "#{line_num}: #{line}"

end

  return "hello"

end

#check_balance



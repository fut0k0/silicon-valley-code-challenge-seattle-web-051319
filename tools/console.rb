require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

apple = Startup.new("Apple", "Steve Jobs", "hardware")
microsoft = Startup.new("Microsoft", "Bill Gates", "software")
amazon = Startup.new("Amazon", "Jeff Bezos", "services")
orange = Startup.new("Orange", "Steve Jobs", "software")

bobby = VentureCapitalist.new("Bobby")
timmy = VentureCapitalist.new("Timmy")
annie = VentureCapitalist.new("Annie")

one = FundingRound.new(apple, bobby, "Angel", 5.0)
two = FundingRound.new(apple, annie, "Seed", 75.0)
three = FundingRound.new(microsoft, timmy, "Seed", 500.0)
four = FundingRound.new(microsoft, bobby, "Seed", 25.0)
five = FundingRound.new(microsoft, annie, "Seed", 350.0)
six = FundingRound.new(amazon, timmy,"Series A", 50.0)
seven = FundingRound.new(amazon, bobby, "Series B", 70.0)
eight = FundingRound.new(apple, bobby, "Series B", 50.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
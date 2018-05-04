class ReleaseCalendar::CLI

  def call
    ReleaseCalendar::Scraper.new.make_sneakers
    puts "Sneaker Release Calendar"
    start
  end

  def start
    print_sneakers_list

    puts ""
    puts "Which sneaker release would you like to see?"
    input = gets.strip.to_i

    sneaker = ReleaseCalendar::Release.find(input)

    print_sneaker_info(sneaker)

    puts ""
    puts "Would you like to see another sneaker release? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you and GOOD LUCK!"
      exit
    else
      puts ""
      puts "Sorry, I couldn't understand."
      start
    end
  end

  def print_sneakers_list
    puts ""
    puts "-------- Upcoming Sneaker Releases --------"
    puts ""
    ReleaseCalendar::Release.all.each.with_index(1) do |sneaker, index|
      puts "#{index}. #{sneaker.name} --- #{sneaker.date}"
    end
  end

  def print_sneaker_info(sneaker)
    puts ""
    puts "-------- #{sneaker.name} --------"
    puts ""
    puts "Color:          #{sneaker.color}"
    puts "Release Date:   #{sneaker.date}"
    puts "Retail Price:   #{sneaker.price}"
    puts ""
    puts "-------- Description --------"
    puts ""
    puts "#{sneaker.description}"
    puts ""
  end

end

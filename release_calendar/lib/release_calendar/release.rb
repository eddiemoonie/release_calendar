class ReleaseCalendar::Release
  attr_accessor :name, :url, :price, :date

  @@all = []

  def initialize(name=nil, url=nil, price=nil, date=nil)
    @name =name
    @url = url
    @price = price
    @date = date
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_kicksonfire
    doc = Nokogiri::HTML(open("https://www.kicksonfire.com/app/"))

    sneaker = self.new
    sneaker.name =
  end

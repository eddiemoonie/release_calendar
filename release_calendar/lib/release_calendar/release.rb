class ReleaseCalendar::Release

  attr_accessor :name, :url, :price, :date, :color, :description

  @@all = []

  def self.new_from_index_page(s)
    self.new(
      r.css("div.release-date-title").text.strip,
      r.css("a").attr("href").text.strip,
      r.css("p.att-val span").text.strip,
      r.css("div.event-date.first-event").text.strip
    )
  end

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

  def color
    
  end

  def description

  end
  
end


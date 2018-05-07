class ReleaseCalendar::Release

  attr_accessor :name, :url, :price, :date, :color, :description

  @@all = []

  def self.new_from_index_page(s)
    self.new(
      s.css("div.release-date-title").text.strip,
      s.css("a").attribute("href").text.strip,
      s.css("div.event-date.first-event").text.strip
    )
  end

  def initialize(name=nil, url=nil, date=nil)
    @name =name
    @url = url
    @date = date
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def color
    @color ||= doc.css("p.style").text
  end

  def description
    @description ||= doc.css("p.release-description").text.strip
  end

  def price
    @price ||= doc.css("span").text.strip
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end



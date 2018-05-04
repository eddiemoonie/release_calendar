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

  def self.find(id)
    self.all[id-1]
  end

  def color
    @color ||= doc.css("p.style").text
  end

  def description
    @description ||= doc.css("p.release-description").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end



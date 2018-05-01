class ReleaseCalendar::Release
  attr_accessor :name, :url, :price, :date, :color, :description

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("div.release-date-title").text,

    )

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

end

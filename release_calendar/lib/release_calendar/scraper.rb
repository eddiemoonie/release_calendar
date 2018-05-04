class ReleaseCalendar::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.kicksonfire.com/app/"))
  end

  def scrape_sneakers_index
    self.get_page.css("div.release-date-title")
  end

  def make_sneakers
    scrape_sneakers_index.each do |s|
      ReleaseCalendar::Release.new_from_index_page(s)
  end


end

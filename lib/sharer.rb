class Sharer
  class << self
    # collects all the app urls and outputs them to data/app_urls
    def app_urls
      @@driver = Selenium::WebDriver.for :chrome
      @@driver.navigate.to url
      doc = Nokogiri::HTML(@@driver.page_source)
      debugger
      p 'done'
    end
  end
end

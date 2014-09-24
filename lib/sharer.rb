class Sharer
  class << self
    # collects all the app urls and outputs them to data/app_urls.csv
    def app_urls
      begin
        url = 'https://share.oculusvr.com/category/all'
        CSV.open('data/app_urls.csv', 'w') do |csv|
          @@driver = Selenium::WebDriver.for :chrome
          @@driver.navigate.to url
          doc = Nokogiri::HTML(@@driver.page_source)
          links = doc.css('.appPod .nameWrap a')
          links.each do |x|
            csv << ["https://share.oculusvr.com#{x[:href]}"]
          end
        end
      ensure
        @@driver.quit if @@driver
      end
    end
  end
end

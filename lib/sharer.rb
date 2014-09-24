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

    # goes to every app url and scrape the data
    def app_details
      begin
        @@driver = Selenium::WebDriver.for :chrome
        path = 'data/app_urls.csv'
        CSV.read(path, encoding: "UTF-8").each_with_index do |row,i|
          next if i > 0 # for debugging
          @@driver.navigate.to row[0].strip
          doc = Nokogiri::HTML(@@driver.page_source)
          debugger
          a = App.new
          a.title = doc.css('#appsOuterWrap .appsHeader h1').text
          a.version_and_notes = doc.css('#version').text

          platforms = []
          platforms << 'pc' if doc.css('#download_pc').size > 0
          platforms << 'mac' if doc.css('#download_mac').size > 0
          platforms << 'linux' if doc.css('#download_linux').size > 0
          a.platforms = platforms.join(',')

          # TODO:
          # youtube embed url
          # screenshot if there's no video
          # screenshots
          #

          username = doc.css('.displayName').text
          unless (user = User.find_by_name(username))
            user = User.new
            user.name = username
            user.website = doc.css('.contactWrap a').first[:href] rescue nil
            user.save!
          end
          a.user = user

          a.long_description = doc.css('.appDesc').to_html rescue nil
          a.minimum_system_requirements = doc.css('.tabBoxInner').first.to_html rescue nil
          a.setup_instructions = doc.css('.tabBoxInner').last.to_html rescue nil

          a.developer = doc.css('.metaData table tr')[0].css('td')[1].text rescue nil
          a.publisher =doc.css('.metaData table tr')[1].css('td')[1].text rescue nil
          a.released_at = Time.parse(doc.css('.metaData table tr')[2].css('td')[1].text) rescue nil
          a.rift_versions = doc.css('.metaData .pad')[0].text rescue nil
          a.controllers = doc.css('.metaData .pad')[1].text rescue nil
          a.modes = doc.css('.metaData .pad')[2].text rescue nil

          category = Category.find_by_title(doc.css('.metaData ul a')[0].text)
          a.category = category

          a.credits = doc.css('.appCredits').first.to_html rescue nil

          a.save!

          # TODO: handle more than 1 genre
          genre = Genre.find_by_title(doc.css('.metaData ul a')[1].text)
          a.genres << genre

          p 'done'
        end
      ensure
        @@driver.quit if @@driver
      end
    end
  end
end

# scrape data from Oculus Share
unless Rails.env == 'production'
  require 'raker'
  require 'sharer'
  namespace :import do
    desc 'bundle exec rake -t import:app_urls'
    task :app_urls, [] => :environment do |task, args|
      Sharer.app_urls
    end
  end
end

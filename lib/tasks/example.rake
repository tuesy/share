=begin
A simple Ruby wrapper for the Share API (see API.md)
using ActiveResource, which likes RESTful APIs

TODO: make a gem
TODO: make cucumber tests for these flows

Prereqs: bundle install

Usage: bundle exec rake example
=end

task :example, [] => :environment do |task, args|
  # create an app
  puts '> creating the app'
  app = AppResource.new
  app.title = 'VeRy Angry Birds'
  app.short_description = "Play as the birds or as the pigs!"
  app.author = 'Parzi'
  app.price = 0.99
  app.save!

  # read it
  app = AppResource.find(app.id)
  puts "check it: #{app.title}"

  # update it
  puts '> updating the app'
  app.title = 'VeRy Angry Birds 2'
  app.save!

  # verify that the title changed
  app = AppResource.find(app.id)
  puts "title should have changed: #{app.title}"

  # # download the app (robots.zip) to the local directory
  # puts '> downloading the app'
  # app.download
  # puts "there should now be a robots.zip file here: #{File.exists?('robots.zip')}"

  # create a comment for this app
  puts '> creating a comment'
  comment = CommentResource.new
  comment.app_id = app.id
  comment.text = "VeRy fun indeed! ;-)"
  comment.save!
  puts "comments for this app: #{app.get(:comments)}"

  # update a comment
  puts '> updating a comment'
  comment.text = "too fast"
  comment.save
  puts "comments for this app: #{app.get(:comments)}"

  # finally, delete it and verify that it's gone
  puts '> deleting the app'
  app.destroy
  begin
    app = AppResource.find(app.id)
  rescue ActiveResource::ResourceNotFound => e
    puts "and a nice message saying the server couldn't find it: \"#{e.message}\""
  end
end

=begin
A simple Ruby wrapper for the Share API (see API.md)
using ActiveResource, which likes RESTful APIs

TODO: make a gem
TODO: make cucumber tests for these flows

Prereqs: bundle install

Usage: bundle exec ruby example.rb
=end

require_relative 'lib/oculus_share'
require 'debugger'

# create an app
puts '> creating the app'
app = OculusShare::App.new
app.title = 'VeRy Angry Birds'
app.short_description = "Play as the birds or as the pigs!"
app.author = 'Parzi'
app.price = 0.99
app.save!

# read it
app = OculusShare::App.find(app.id)
puts "check it: #{app.title}"

# update it
puts '> updating the app'
app.title = 'VeRy Angry Birds 2'
app.save!

# verify that the title changed
app = OculusShare::App.find(app.id)
puts "title should have changed: #{app.title}"

# download the app (robots.zip) to the local directory
puts '> downloading the app'
app.download
puts "there should now be a robots.zip file here: #{File.exists?('robots.zip')}"

# finally, delete it
puts '> deleting the app'
app.destroy
# verify that it's gone now
begin
  app = OculusShare::App.find(app.id)
rescue ActiveResource::ResourceNotFound => e
  puts "and a nice message saying the server couldn't find it: \"#{e.message}\""
end


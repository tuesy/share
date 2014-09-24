class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :title
      t.string :youtube_embed_url
      t.string :primary_screenshot
      t.string :screenshot1, :screenshot2, :screenshot3, :screenshot4, :screenshot5
      t.string :platforms
      t.text :long_description
      t.text :short_description
      t.text :minimum_system_requirements
      t.text :setup_instructions
      t.text :version_and_notes
      t.text :known_bugs
      t.string :controllers
      t.string :modes
      t.integer :category_id
      t.integer :user_id
      t.date :released_at
      t.string :publisher
      t.string :support_email
      t.string :paypal_id
      t.string :donation_email
      t.string :facebook_url, :twitter_url, :kickstarter_url, :youtube_url, :googleplus_url, :linkedin_url
      t.text :credits
      t.text :copyrights
      t.text :disclaimers
      t.string :rift_versions
      t.string :developer
      t.timestamps
    end
    create_table :users do |t|
      t.string :name
      t.string :submitter
      t.string :phone
      t.text :address
      t.string :email
      t.string :website
      t.timestamps
    end
    create_table :genres do |t|
      t.string :title
      t.timestamps
    end
    create_table :categories do |t|
      t.string :title
      t.timestamps
    end
    create_table :apps_genres, id: false do |t|
      t.belongs_to :app
      t.belongs_to :genre
      t.timestamps
    end
  end
end

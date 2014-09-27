class CopyOverAuthorNames < ActiveRecord::Migration
  def up
    App.all.each do |x|
      if x.author.blank?
        x.author = x.user.try(:name)
        x.save!
      end
    end
  end
  def down
    # nothing
  end
end

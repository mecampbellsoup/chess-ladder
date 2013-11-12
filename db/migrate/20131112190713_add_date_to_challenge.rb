class AddDateToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :date_played, :datetime
  end
end

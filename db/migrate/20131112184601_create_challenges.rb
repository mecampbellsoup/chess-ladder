class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :winner_id
      t.integer :loser_id
      
      t.timestamps
    end
  end
end

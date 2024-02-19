class ChangeKaiwasToTopics < ActiveRecord::Migration[6.1]
  def change
    rename_table :kaiwas, :topics
  end
end

class CreateKaiwas < ActiveRecord::Migration[6.1]
  def change
    create_table :kaiwas do |t|
      t.text :contents

      t.timestamps
    end
  end
end

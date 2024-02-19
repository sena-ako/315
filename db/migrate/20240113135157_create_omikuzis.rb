class CreateOmikuzis < ActiveRecord::Migration[6.1]
  def change
    create_table :omikuzis do |t|
      t.text :body

      t.timestamps
    end
  end
end

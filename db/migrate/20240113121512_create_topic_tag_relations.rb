class CreateTopicTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :topic_tag_relations do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end

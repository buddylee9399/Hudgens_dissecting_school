class CreateGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :guides do |t|
      t.string :title
      t.text :content
      t.references :topic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.boolean :live_updates, default: false

      t.timestamps
    end
  end
end

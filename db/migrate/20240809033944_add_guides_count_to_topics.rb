class AddGuidesCountToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :guides_count, :integer, default: 0, null: false
  end
end

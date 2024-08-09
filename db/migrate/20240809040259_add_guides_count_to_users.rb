class AddGuidesCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :guides_count, :integer, default: 0, null: false
  end
end

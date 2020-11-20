class AddUserIdToType < ActiveRecord::Migration[6.0]
  def change
    add_column :types, :user_id, :integer
  end
end

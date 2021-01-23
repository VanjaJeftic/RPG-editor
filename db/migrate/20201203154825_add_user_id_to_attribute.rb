class AddUserIdToAttribute < ActiveRecord::Migration[6.0]
  def change
    add_column :attributes, :user_id, :integer
  end
end

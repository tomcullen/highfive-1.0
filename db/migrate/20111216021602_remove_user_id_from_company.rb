class RemoveUserIdFromCompany < ActiveRecord::Migration
  def up
    remove_column :companies, :user_id
  end

  def down
    add_column :companies, :user_id, :integer
  end
end

class RemoveContactIdFromCompanies < ActiveRecord::Migration
  def up
    remove_column :companies, :contact_id
  end

  def down
    add_column :companies, :contact_id, :integer
  end
end

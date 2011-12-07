class RemoveCompanyIdFromContacts < ActiveRecord::Migration
  def up
    remove_column :contacts, :company_id
  end

  def down
    add_column :contacts, :company_id, :string
  end
end

class RemoveJobConnectionIdFromContacts < ActiveRecord::Migration
  def up
    remove_column :contacts, :job_connection_id
  end

  def down
    add_column :contacts, :job_connection_id, :integer
  end
end

class RemoveJobIdFromCompany < ActiveRecord::Migration
  def up
    remove_column :companies, :job_id
  end

  def down
    add_column :companies, :job_id, :integer
  end
end

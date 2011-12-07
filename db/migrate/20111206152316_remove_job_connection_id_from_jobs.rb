class RemoveJobConnectionIdFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :job_connection_id
  end

  def down
    add_column :jobs, :job_connection_id, :integer
  end
end

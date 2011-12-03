class CreateJobconnections < ActiveRecord::Migration
  def change
    create_table :jobconnections do |t|
      t.string :note
      t.integer :job_id
      t.integer :contact_id

      t.timestamps
    end
  end
end

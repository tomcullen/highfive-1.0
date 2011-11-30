class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :jobtitle
      t.string :jobdescription
      t.string :postinglink
      t.datetime :dateofposting
      t.integer :salary
      t.string :careerfield
      t.datetime :dateappliedto
      t.integer :company_id
      t.integer :user_id
      t.integer :job_connection_id

      t.timestamps
    end
  end
end

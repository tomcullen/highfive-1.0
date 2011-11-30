class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :companyname
      t.string :website
      t.string :industry
      t.string :companynotes
      t.integer :contact_id
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end

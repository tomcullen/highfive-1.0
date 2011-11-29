class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :jobtitle
      t.string :email
      t.string :twitter
      t.string :linkedin
      t.string :facebook
      t.integer :mainphone
      t.integer :workphone
      t.integer :faxnumber
      t.string :meetups
      t.string :meetup_url
      t.text :otherinfo
      t.integer :job_connection_id
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end
  end
end

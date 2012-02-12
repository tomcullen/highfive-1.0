class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :contact_id
      t.integer :user_id
      t.text :notes
      t.string :plan
      t.datetime :meeting_date
      t.string :state

      t.timestamps
    end
  end
end

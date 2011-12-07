class CreateContactcompanyjoins < ActiveRecord::Migration
  def change
    create_table :contactcompanyjoins do |t|
      t.integer :contact_id
      t.integer :company_id

      t.timestamps
    end
  end
end

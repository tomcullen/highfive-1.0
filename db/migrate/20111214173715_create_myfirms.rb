class CreateMyfirms < ActiveRecord::Migration
  def change
    create_table :myfirms do |t|
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end

class CreateMyfirms < ActiveRecord::Migration
  def change
    create_table :myfirms do |t|
      t.string :user_id
      t.string :company_id

      t.timestamps
    end
  end
end

class CreateInteresteds < ActiveRecord::Migration
  def change
    create_table :interesteds do |t|
      t.string :email

      t.timestamps
    end
  end
end

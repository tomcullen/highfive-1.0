class CreateUserCareerJoins < ActiveRecord::Migration
  def change
    create_table :user_career_joins do |t|
      t.integer :user_id
      t.integer :career_id

      t.timestamps
    end
  end
end

class ChangeDataTypeForMyfirmsUserId < ActiveRecord::Migration
  def up
    change_table :myfirms do |t|
      t.change :user_id, :integer
      t.change :company_id, :integer
    end
  end

  def down
    change_table :myfirms do |t|
      t.change :user_id, :string
      t.change :company_id, :string
    end
  end
end

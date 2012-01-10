class ChangeDataTypeForContactsMainphone < ActiveRecord::Migration
  def up
    change_table :contacts do |t|
      t.change :mainphone, :string
      t.change :workphone, :string
      t.change :faxnumber, :string
    end
  end

  def down
    change_table :contacts do |t|
      t.change :mainphone, :integer
      t.change :workphone, :integer
      t.change :faxnumber, :integer
    end
  end
end

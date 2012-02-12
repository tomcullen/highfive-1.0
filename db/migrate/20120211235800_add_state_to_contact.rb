class AddStateToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :state, :string, default: "d"
  end
end

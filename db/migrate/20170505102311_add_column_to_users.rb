class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :age, :integer
    add_column :users, :role, :string
  end
end

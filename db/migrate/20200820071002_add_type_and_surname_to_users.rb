class AddTypeAndSurnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :surname, :string
    add_index :users, :type
  end
end

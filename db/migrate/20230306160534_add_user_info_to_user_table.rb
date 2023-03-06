class AddUserInfoToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :DOB, :date
    add_column :users, :date_preference1, :string
    add_column :users, :date_preference2, :string
    add_column :users, :date_preference3, :string
  end
end

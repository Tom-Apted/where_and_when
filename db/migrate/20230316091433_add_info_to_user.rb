class AddInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :job, :string
    add_column :users, :prompt1title, :text
    add_column :users, :prompt1text, :text
    add_column :users, :prompt2title, :text
    add_column :users, :prompt2text, :text
  end
end

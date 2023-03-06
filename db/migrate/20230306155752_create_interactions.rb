class CreateInteractions < ActiveRecord::Migration[7.0]
  def change
    create_table :interactions do |t|

      t.timestamps
    end
  end
end

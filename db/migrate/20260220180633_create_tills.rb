class CreateTills < ActiveRecord::Migration[8.1]
  def change
    create_table :tills do |t|
      t.string :name

      t.timestamps
    end
  end
end

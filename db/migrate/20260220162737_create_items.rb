class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :net_price
      t.decimal :vat_rate

      t.timestamps
    end
  end
end

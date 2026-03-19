class CreateSales < ActiveRecord::Migration[8.1]
  def change
    create_table :sales do |t|
      t.references :till_session, null: false, foreign_key: true

      t.datetime :started_at, null: false
      t.datetime :completed_at

      t.timestamps
    end

    create_table :sale_items do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.integer :quantity, null: false
      t.decimal :net_price, null: false
      t.decimal :vat_rate, null: false
      t.decimal :vat_price, null: false
      t.decimal :gross_price, null: false

      t.timestamps
    end

    create_table :payments do |t|
      t.references :sale, null: false, foreign_key: true

      t.string :method, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end

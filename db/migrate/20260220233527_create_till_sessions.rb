class CreateTillSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :till_sessions do |t|
      t.references :till, null: false, foreign_key: true

      t.decimal :opening_float, null: false
      t.decimal :closing_float

      t.datetime :opened_at, null: false
      t.datetime :closed_at

      t.timestamps
    end

    # Ensure that only a single *active* till session can exist at one time.
    add_index :till_sessions,
              :till_id,
              unique: true,
              where: "closed_at IS NULL",
              name: "unique_active_till_session_per_till"

    # Prevent tills from being deleted if there are till sessions.
    add_foreign_key :till_sessions, :tills, on_delete: :restrict
  end
end

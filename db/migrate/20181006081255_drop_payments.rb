class DropPayments < ActiveRecord::Migration[5.2]
  def up
    drop_table :payments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

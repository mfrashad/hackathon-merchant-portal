class RenameTransactionsToPayments < ActiveRecord::Migration[5.2]
  def change
    rename_table :transactions, :payments
  end
end

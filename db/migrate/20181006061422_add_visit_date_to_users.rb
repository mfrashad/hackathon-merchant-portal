class AddVisitDateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :visit_date, :datetime, null: false, default: DateTime.now
  end
end

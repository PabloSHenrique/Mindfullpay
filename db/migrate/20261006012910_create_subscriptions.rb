class CreateSubscriptions < ActiveRecord::Migration[8.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :due_date
      t.string :category
      t.decimal :price

      t.timestamps
    end
  end
end

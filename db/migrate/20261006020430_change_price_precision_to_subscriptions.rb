class ChangePricePrecisionToSubscriptions < ActiveRecord::Migration[8.1]
  def change
    change_column :subscriptions, :price, :decimal, precision: 10, scale: 2
  end
end

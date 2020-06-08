class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.string :active
      t.string :total_active
      t.string :active_price
      t.string :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

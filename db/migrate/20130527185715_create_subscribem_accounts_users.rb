class CreateSubscribemAccountsUsers < ActiveRecord::Migration
  def change
    create_table :subscribem_accounts_users do |t|
      t.integer :account_id
      t.integer :user_id

      t.timestamps
    end
  end
end

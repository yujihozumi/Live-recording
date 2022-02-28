class AddColumnsbodyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_body, :text
  end
end

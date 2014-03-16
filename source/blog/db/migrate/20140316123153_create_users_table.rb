class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :salt
      t.string :hashword
      t.timestamps
    end
  end
end

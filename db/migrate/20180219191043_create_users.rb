class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :team_role, default: 0
      t.timestamps
    end
  end
end

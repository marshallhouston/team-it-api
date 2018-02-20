class CreateTeamFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_followers do |t|
      t.references :user, foreign_key: true, index: true
      t.references :team, foreign_key: true, index: true
    end
  end
end

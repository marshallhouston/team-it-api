class AddTeamCodeToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :team_code, :integer
    add_index :teams, :team_code
  end
end
